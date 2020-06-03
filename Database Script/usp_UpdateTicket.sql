CREATE PROCEDURE usp_UpdateTicket
@TicketsID INT,
@TicketStatusesID INT,
@ParkingSpotsID INT,
@VehicleTypesID INT,
@StaffID INT
AS
	BEGIN
		DECLARE 
		@CurrentTicketStatusID INT,
		@VehicleSize INT

		SELECT @CurrentTicketStatusID = TicketStatusesID
		FROM Tickets
		WHERE ID = @TicketsID

		SELECT @VehicleSize = ParkSize
		FROM VehicleTypes
		WHERE ID = @VehicleTypesID

		IF(@CurrentTicketStatusID != @TicketStatusesID)
		BEGIN
			UPDATE Tickets
			SET TicketStatusesID = @TicketStatusesID
			WHERE ID = @TicketsID

			INSERT INTO StatusChanges(TicketsID, TicketStatusesID, StaffID)
			VALUES(@TicketsID, @TicketStatusesID, @StaffID)
		END

		IF(@TicketStatusesID = 7)
		BEGIN
			UPDATE ParkingSpots
			SET ParkingStatusesID = 1, --VACANT
			ParkCapacity = ParkCapacity + @VehicleSize --Addera tillbaka fordonsstorlek
			WHERE ID = @ParkingSpotsID
		END
	END
GO