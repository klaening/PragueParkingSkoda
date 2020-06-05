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
				@TicketID INT
	
			SELECT 
				@TicketID = ID
			FROM INSERTED
		
		--L�GG �VER FR�N TICKETS TILL RETURNEDTICKETS TABELL
			INSERT INTO ReturnedTickets(TicketsID, RegNo, PhoneNo, PID, Comment, ParkingSpotsID, VehicleTypesID, StaffID)
			SELECT I.ID, I.RegNo, I.PhoneNo, I.PID, I.Comment, I.ParkingSpotsID, I.VehicleTypesID, I.StaffID
			FROM INSERTED I
		--TA BORT FR�N TICKETS TABELL
			DELETE Tickets
			WHERE ID = (@TicketID)
		END
	END
GO
