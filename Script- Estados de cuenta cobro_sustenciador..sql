/*

	Autor: Eskarly Taquez
	Fecha: 12/01/2022


--select * from cnt_contrato where cnt_numero_cont = '646';
--select * from cnt_contrato where cnt_numero_cont = '3196' and CNT_PK_CONTRATO = 10910;
--select * from cnt_pago_contratos where fk_cnt_contrato = 10061;
--´pago a actualizar
--select * from cnt_pago_contratos where fk_cnt_contrato = 8938 and pk_cnt_pago_cont = 45347;

*/

begin
    begin
        -- Actualizar Datos
        UPDATE cnt_pago_contratos set PAG_INF_APROB_SUS = 'S' where fk_cnt_contrato = 8360 and pk_cnt_pago_cont = 44495;
        -- if DELETE succeeds, commit the transaction
        exception 
        when OTHERS then
            dbms_output.put_line('No se pudo actualizar un dato, se hace rollback: ' || sqlerrm);
        rollback; 
    end;
    commit; 
end;

