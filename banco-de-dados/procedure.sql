DELIMITER //
CREATE PROCEDURE sp_transferir_aluno(
    IN p_id_aluno INT,
    IN p_id_turma_origem INT,
    IN p_id_turma_destino INT
)
BEGIN
    UPDATE matricula
    SET status = 'INATIVA'
    WHERE id_aluno = p_id_aluno AND id_turma = p_id_turma_origem AND status = 'ATIVA';
   
    INSERT INTO matricula (id_aluno, id_turma, data_matricula, status)
    VALUES (p_id_aluno, p_id_turma_destino, CURDATE(), 'ATIVA');
   
    SELECT 'Aluno transferido com sucesso' AS resultado;
END //
DELIMITER ;
