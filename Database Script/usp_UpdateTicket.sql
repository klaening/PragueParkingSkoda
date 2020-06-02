CREATE PROCEDURE usp_UpdateTicket
@TicketsID INT,
@TicketStatusesID INT,
@StaffID INT
AS
BEGIN
	DECLARE @CurrentTicketStatusID INT
	SELECT @CurrentTicketStatusID = TicketStatusesID
	FROM Tickets
	WHERE ID = @TicketsID

	IF(@CurrentTicketStatusID != @TicketStatusesID)
	BEGIN
		UPDATE Tickets
		SET TicketStatusesID = @TicketStatusesID
		WHERE ID = @TicketsID

		INSERT INTO StatusChanges(TicketsID, TicketStatusesID, StaffID)
		VALUES(@TicketsID, @TicketStatusesID, @StaffID)
	END
	ELSE
	BEGIN 
		PRINT 'TicketStatusesID same as before
		'
	END
END