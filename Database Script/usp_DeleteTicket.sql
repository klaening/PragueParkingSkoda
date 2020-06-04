
CREATE PROCEDURE usp_DeleteTicket
@TicketsID INT
AS
	BEGIN

		DELETE DamageReports
		WHERE TicketsID = @TicketsID

		DELETE StatusChanges
		WHERE TicketsID = @TicketsID

		DELETE Tickets
		WHERE ID = @TicketsID

	END
GO