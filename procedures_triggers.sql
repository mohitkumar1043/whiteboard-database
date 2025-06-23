DELIMITER //

-- Trigger: Log note updates
CREATE TRIGGER after_note_update
AFTER UPDATE ON Notes
FOR EACH ROW
BEGIN
    INSERT INTO AuditLogs (user_id, action_type, description, action_time)
    VALUES (NEW.element_id, 'UPDATE_NOTE', CONCAT('Note ', NEW.note_id, ' updated'), NOW());
END //

-- Procedure: Undo last change from VersionHistory
CREATE PROCEDURE UndoLastChange(IN boardId INT)
BEGIN
    DELETE FROM VersionHistory
    WHERE board_id = boardId
    ORDER BY version_time DESC
    LIMIT 1;
END //

DELIMITER ;

-- View: Collaborator details with usernames
CREATE VIEW CollaboratorDetails AS
SELECT c.board_id, u.username, c.permission
FROM Collaborators c
JOIN Users u ON c.user_id = u.user_id;