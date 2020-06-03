CREATE TRIGGER tr_Tickets_AfterUpdate
ON Tickets
AFTER UPDATE
AS

	BEGIN

		DECLARE @TicketStatus INT

		SELECT @TicketStatus = TicketStatusesID
		FROM INSERTED

		IF(@TicketStatus = 7) --RETURNED
		BEGIN
		
			DECLARE 
				@TicketID INT,
				@VehicleTypesID INT,
				@VehicleSize INT,
				@ParkingSpotsID INT
	
			SELECT 
				@TicketID = ID,
				@VehicleTypesID = VehicleTypesID,
				@ParkingSpotsID = ParkingSpotsID
			FROM INSERTED

			SELECT @VehicleSize = ParkSize
			FROM VehicleTypes
			WHERE ID = @VehicleTypesID
		
		--LÄGG ÖVER FRÅN TICKETS TILL RETURNEDTICKETS TABELL
			INSERT INTO ReturnedTickets(TicketsID, RegNo, PhoneNo, PID, Comment, ParkingSpotsID, VehicleTypesID, StaffID)
			SELECT I.ID, I.RegNo, I.PhoneNo, I.PID, I.Comment, I.ParkingSpotsID, I.VehicleTypesID, I.StaffID
			FROM INSERTED I
		--TA BORT FRÅN TICKETS TABELL
			DELETE Tickets
			WHERE ID = (@TicketID)

		--UPPDATERA PARKINGSPLATSEN TILL LEDIG
			UPDATE ParkingSpots
			SET ParkingStatusesID = 1, --VACANT
			ParkCapacity = ParkCapacity + @VehicleSize --Addera tillbaka fordonsstorlek
			WHERE ID = @ParkingSpotsID
		END
	END
GO
