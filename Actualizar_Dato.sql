/*

	 Base Ejecución: ECM
	Autor: Eskarly Taquez
	Fecha: 01/04/2022

*/

-- select * from EDO_INBOX where EED_DOCUMENT_ID = 386241;

----- ESTADOS DE DOCUMENTOS-------------------------------------------------------------------
Borrador = 1

Enviado a corregir =2

Pedndiente de aprobación = 3

Pendiente de firma = 4

Firmado= 5

Aprobado = 6

Radicado = 7

Prueba


--------------------------------------------------------------------------------------------
begin
    begin
        -- Actualizar Datos
       update EDO_ELECTRONIC_DOC set EDD_STATE = 4 where eed_document_id in (386241);
       update EDO_INBOX set USR_ASSIGN_USER_ID = 1057711095 where EDI_ID in (1290615);
        exception 
        when OTHERS then
            dbms_output.put_line('No se pudo actualizar un dato, se hace rollback: ' || sqlerrm);
        rollback; 
    end;
    dbms_output.put_line('Datos actualizados correctamente: ' || sqlerrm);
    commit; 
end;


