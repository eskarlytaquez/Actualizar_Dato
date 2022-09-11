begin
    begin
        -- Actualizar datos.
		
        UPDATE CNT_CONTRATO set  FK_ESTADO_CNT = 4  where CNT_PK_CONTRATO = 7892;
       
        
        exception 
        when dup_val_on_index then
            dbms_output.put_line('No se pudo actualizar un dato, se hace rollback: ' || sqlerrm);
        rollback; 
    end;
    commit; 
end;