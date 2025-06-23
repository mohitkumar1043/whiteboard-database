-- List whiteboards created by a user
SELECT * FROM Whiteboards WHERE owner_id = 1;

-- Get collaborators and permissions for board 1
SELECT * FROM CollaboratorDetails WHERE board_id = 1;

-- List all drawing elements and notes for board 1
SELECT de.element_type, de.properties, n.content
FROM DrawingElements de
LEFT JOIN Notes n ON de.element_id = n.element_id
WHERE de.board_id = 1;

-- View version history of a board
SELECT * FROM VersionHistory WHERE board_id = 1 ORDER BY version_time DESC;

-- View audit logs
SELECT * FROM AuditLogs ORDER BY action_time DESC;