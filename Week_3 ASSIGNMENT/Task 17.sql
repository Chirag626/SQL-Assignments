 -- Task 17  Create a user, create a login for that user, provide permissions of DB_owner to the user.

CREATE LOGIN NewUserLogin WITH PASSWORD = '1234';
CREATE USER NewUser FOR LOGIN NewUserLogin;
ALTER ROLE db_owner ADD MEMBER NewUser;


-- 1. Verify Login Creation
SELECT name, type_desc, is_disabled 
FROM sys.server_principals
WHERE name = 'NewUserLogin';

-- 2. Verify User Creation
SELECT name, type_desc
FROM sys.database_principals
WHERE name = 'NewUser';

-- 3. Verify Permissions
SELECT dp.name AS DatabaseRoleName, mp.name AS MemberName
FROM sys.database_role_members AS drm
JOIN sys.database_principals AS dp ON dp.principal_id = drm.role_principal_id
JOIN sys.database_principals AS mp ON mp.principal_id = drm.member_principal_id
WHERE dp.name = 'db_owner' AND mp.name = 'NewUser';