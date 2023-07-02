DECLARE
  myNumber NUMBER := &enter_the_number; -- Input number
BEGIN
  DBMS_OUTPUT.PUT_LINE('Original Number: ' || myNumber);
  Square(myNumber); -- Calling the procedure
  DBMS_OUTPUT.PUT_LINE('Square: ' || myNumber);
END;
/