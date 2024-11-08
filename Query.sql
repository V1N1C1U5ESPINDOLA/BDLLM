SELECT 
    p.nome AS paciente,
    a.data_agendamento AS data_agendada,
    CURRENT_DATE - a.data_agendamento AS dias_atraso
FROM 
    pacientes p
JOIN 
    agendamentos a ON p.id = a.paciente_id
JOIN 
    comparecimento c ON a.id = c.agendamento_id
WHERE 
    c.compareceu = FALSE;