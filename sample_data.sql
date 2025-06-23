INSERT INTO Users (username, password_hash, role) VALUES
('admin_user', 'hashed_pw_1', 'admin'),
('collab_user', 'hashed_pw_2', 'collaborator'),
('viewer_user', 'hashed_pw_3', 'viewer');

INSERT INTO Whiteboards (board_name, owner_id) VALUES
('Project Plan Board', 1),
('Team Collaboration Board', 2);

INSERT INTO Collaborators (board_id, user_id, permission) VALUES
(1, 2, 'write'),
(1, 3, 'read'),
(2, 1, 'write');

INSERT INTO DrawingElements (board_id, element_type, properties, created_by) VALUES
(1, 'rectangle', '{"x":10,"y":20,"width":100,"height":50}', 1),
(1, 'line', '{"x1":0,"y1":0,"x2":100,"y2":100}', 2);

INSERT INTO Notes (element_id, content) VALUES
(1, 'This rectangle shows the main workspace.'),
(2, 'Line connecting components.');

INSERT INTO VersionHistory (board_id, description) VALUES
(1, 'Created rectangle element'),
(1, 'Added connecting line');

INSERT INTO AuditLogs (user_id, action_type, description) VALUES
(1, 'CREATE_ELEMENT', 'User 1 created a rectangle.'),
(2, 'ADD_NOTE', 'User 2 added a note to the line.');