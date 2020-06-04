CREATE PROCEDURE usp_UpdateTicket
@TicketsID INT,
@RegNo VARCHAR(50),
@RetrievalCode VARCHAR(50),
@PhoneNo VARCHAR(50),
@PID VARCHAR(50),
@EstimatedParkingTime DECIMAL(18,0),
@Comment VARCHAR(500),
@ParkingSpotsID INT,
@VehicleTypesID INT,
@TicketStatusesID INT,
@StaffID INT
AS
	BEGIN

		DECLARE 
		@CurrentTicketStatusID INT,
		@VehicleSize INT,
		@CurrentParkingSpot INT

		SELECT	
		@CurrentTicketStatusID = TicketStatusesID,
		@CurrentParkingSpot = ParkingSpotsID
		FROM Tickets
		WHERE ID = @TicketsID

		SELECT @VehicleSize = ParkSize
		FROM VehicleTypes
		WHERE ID = @VehicleTypesID

		BEGIN TRAN CheckStatus WITH MARK

			UPDATE Tickets
			SET RegNo = @RegNo, RetrievalCode = @RetrievalCode, PhoneNo = @PhoneNo, PID = @PID, EstimatedParkingTime = @EstimatedParkingTime, Comment = @Comment, ParkingSpotsID = @ParkingSpotsID, VehicleTypesID = @VehicleTypesID, StaffID = @StaffID
			WHERE ID = @TicketsID

			BEGIN TRY
			--Kollar om parkeringsplatsen behöver uppdateras
				IF(@CurrentParkingSpot != @ParkingSpotsID)
				BEGIN
					UPDATE ParkingSpots
					SET ParkCapacity = ParkCapacity + @VehicleSize
					WHERE ID = @CurrentParkingSpot

					UPDATE ParkingSpots
					SET ParkCapacity = ParkCapacity - @VehicleSize
					WHERE ID = @ParkingSpotsID
				END

				IF(@CurrentTicketStatusID != @TicketStatusesID)
				BEGIN
					UPDATE Tickets
					SET TicketStatusesID = @TicketStatusesID
					WHERE ID = @TicketsID

					INSERT INTO StatusChanges(TicketsID, TicketStatusesID, StaffID)
					VALUES(@TicketsID, @TicketStatusesID, @StaffID)
				END

				COMMIT TRAN CheckStatus
			END TRY
			BEGIN CATCH
				ROLLBACK
			END CATCH

	END
GO