CREATE PROCEDURE usp_NewTicket_Check 
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
		@TicketsID INT,
		@VehicleParkSize INT,	--Fordonets storlek
		@PSpotCapacity INT		--ParkeringsKapacitet

		SELECT @VehicleParkSize = ParkSize	
		FROM VehicleTypes
		WHERE ID = @VehicleTypesID

		SELECT @PSpotCapacity = ParkCapacity
		FROM ParkingSpots
		WHERE ID = @ParkingSpotsID

		BEGIN TRANSACTION SubtractParkCapacity WITH MARK 
			IF (@PSpotCapacity < @VehicleParkSize)
			BEGIN
				PRINT 'Parking Spot`s capacity is smaller than Vehicle Type`s park size
				'
				ROLLBACK
			END
			ELSE
			BEGIN TRY
				INSERT INTO TICKETS
				VALUES(@RegNo, @RetrievalCode, @PhoneNo, @PID, @EstimatedParkingTime, @Comment, @ParkingSpotsID, @VehicleTypesID, @TicketStatusesID)
				SELECT @TicketsID = SCOPE_IDENTITY()

				--usp på denna?
				--Minska på PSpotCapacity
				SET @PSpotCapacity = @PSpotCapacity - @VehicleParkSize

				--Uppdatera ParkingSpots
				UPDATE ParkingSpots
				SET ParkCapacity = @PSpotCapacity
				WHERE ID = @ParkingSpotsID

				--Om kapacitet är 0
				IF (@PSpotCapacity = 0)
				BEGIN
					UPDATE ParkingSpots
					SET ParkingStatusesID = 2 -- 2 = 'Occupied'
					WHERE ID = @ParkingSpotsID
				END
				--Till hit

				--usp?
				INSERT INTO StatusChanges(TicketsID, StaffID, TicketStatusesID)
				VALUES(@TicketsID, @StaffID, @TicketStatusesID)

				SET @TicketStatusesID = @TicketStatusesID + 1

				INSERT INTO StatusChanges(TicketsID, StaffID, TicketStatusesID)
				VALUES(@TicketsID, @StaffID, @TicketStatusesID)

			END TRY
			BEGIN CATCH 
				ROLLBACK
			END CATCH

		COMMIT TRANSACTION SubtractParkCapacity
	END
GO