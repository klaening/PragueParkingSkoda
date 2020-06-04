CREATE TRIGGER tr_Tickets_AfterDelete
ON Tickets
AFTER DELETE
AS
	BEGIN
		
		DECLARE @VehicleID INT
		SELECT @VehicleID = (SELECT VehicleTypesID FROM DELETED)

		DECLARE @VehicleSize INT
		SELECT @VehicleSize = (SELECT ParkSize FROM VehicleTypes
								WHERE ID = @VehicleID)

		UPDATE ParkingSpots
		SET ParkCapacity = ParkCapacity + @VehicleSize
		WHERE ID = (SELECT ParkingSpotsID FROM DELETED)

	END
GO