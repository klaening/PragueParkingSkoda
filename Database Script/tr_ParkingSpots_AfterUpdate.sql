CREATE TRIGGER tr_ParkingSpots_AfterUpdate
ON ParkingSpots
AFTER UPDATE
AS
	BEGIN
		
		DECLARE @PSpotCapacity INT
		SELECT @PSpotCapacity = ParkCapacity FROM INSERTED

		IF(@PSpotCapacity = 0)
		BEGIN 
			UPDATE ParkingSpots
			SET ParkingStatusesID = 2 --2 = 'Occupied'
			WHERE ID = (SELECT ID FROM INSERTED)
		END
		ELSE
		BEGIN
			UPDATE ParkingSpots
			SET ParkingStatusesID = 1 --1 = 'Vacant'
			WHERE ID = (SELECT ID FROM INSERTED)
		END

		--HANTERAR INTE IFALL ParkingStatusesID == 3

	END
GO