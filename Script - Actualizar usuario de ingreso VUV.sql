/*

	Autor: Juan Villamizar
	Fecha: 03/23/2021

*/

BEGIN
    BEGIN
-- update user
            update WFM_ID_USER set WIU_USUARIO = 'patricia.reinoso' where ID_ID = '28722744' and WIU_USUARIO = 'patricia  reinoso';
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('No se pudo actualizar un dato, se hace rollback: ' || sqlerrm);
            ROLLBACK;
    END;

    dbms_output.put_line('Datos Actualizados: ' || sqlerrm);
    COMMIT;
END;