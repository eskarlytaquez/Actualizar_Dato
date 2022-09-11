/*
	 Base Ejecución: Contratistas
	Autor: Eskarly Taquez
	Fecha: 02/25/2021
    

    Scripts selección:
    --Obtener contrato
    select * from CNT_CONTRATO where cnt_numero_cont = 1235;
    
    --obtener único por pk
    select * from CNT_CONTRATO where cnt_numero_cont = numero_contrato and cnt_pk_contrato = pk_del_contrato_solicitado;
    
    -- Obtener pago
    select * from cnt_pago_contratos where fk_cnt_contrato = 12165;
        
    --Obtener último pago
    select * from cnt_pago_contratos where fk_cnt_contrato = 12165
        and PK_CNT_PAGO_CONT = 57019;
    
    --obtener Expediente para verificar documentos faltantes de pago.
    select * from cnt_expediente where cnt_pk_contrato = 12165;
*/

begin
    begin
       -- Actualizar Datos
        
        -- SI EXISTE EL PAGO, PERO NO LA CONSTANCIA DE RADICACIÓN
         update cnt_pago_contratos set PAG_CONS_RAD_EED_ID = 468161 where fk_cnt_contrato = 12165
        and PK_CNT_PAGO_CONT = 57019;  


       --SOLO SI NO EXISTE LA CONSTANCIA DE RADICACION EN EL EXPEDIENTE
        INSERT INTO CNT_EXPEDIENTE (CNT_PK_CONTRATO, DOC_ID, EED_DOCUMENT_ID, TDO_TIPO, DESCRIPCION_TIPO, FECHA_CREACION, PROCESADO, TIPO_RADICACION)
        VALUES ('12165', '0', '468161', '4214', 'ContanciaRad', (select sysdate from dual), '0', 'DE');
        
        exception 
        when OTHERS then
            dbms_output.put_line('No se pudo actualizar un dato, se hace rollback: ' || sqlerrm);
        rollback; 
    end;
    commit; 
end;