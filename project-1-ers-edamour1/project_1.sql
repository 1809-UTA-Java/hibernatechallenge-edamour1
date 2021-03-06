CREATE TABLE ERS_USERS (
    U_ID NUMBER NOT NULL,
    U_USERNAME varchar2(255) NOT NULL,
    U_PASSWORD varchar2(255) NOT NULL,
    U_FIRSTNAME varchar2(255),
    U_LASTNAME varchar2(255),
    U_EMAIL varchar2(255),
    UR_ID NUMBER NOT NULL,
    PRIMARY KEY (U_ID)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ERS_USERS
ADD UNIQUE (U_EMAIL);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ERS_REIMBURSEMENTS (
    R_ID NUMBER NOT NULL,
    R_AMOUNT NUMBER NOT NULL,
    R_DESCRIPTION varchar2(255),
    R_RECEIPT BLOB,
    R_SUBMITTED TIMESTAMP NOT NULL,
    R_RESOLVED TIMESTAMP,
    U_ID_AUTHOR NUMBER NOT NULL,
    U_ID_RESOLVER NUMBER,
    RT_TYPE NUMBER NOT NULL,
    RT_STATUS NUMBER NOT NULL,
    PRIMARY KEY (R_ID)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ERS_REIMBURSEMENT_STATUS (
    RS_ID NUMBER NOT NULL,
    RS_STATUS varchar2(255) NOT NULL,
    PRIMARY KEY (RS_ID)
);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ERS_REIMBURSEMENT_TYPE (
    RT_ID NUMBER NOT NULL,
    RT_TYPE varchar2(255) NOT NULL,
    PRIMARY KEY (RT_ID)
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ERS_REIMBURSEMENTS
ADD FOREIGN KEY (U_ID_AUTHOR) REFERENCES ERS_USERS(U_ID);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ERS_REIMBURSEMENTS
ADD FOREIGN KEY (U_ID_RESOLVER) REFERENCES ERS_USER_ROLES(UR_ID);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ERS_REIMBURSEMENTS
ADD FOREIGN KEY (RT_TYPE) REFERENCES ERS_REIMBURSEMENT_TYPE(RT_ID);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ERS_REIMBURSEMENTS
ADD FOREIGN KEY (RT_STATUS) REFERENCES ERS_REIMBURSEMENT_STATUS(RS_ID);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ers_reimbursements (
    r_id,
    r_amount,
    r_description,
    r_receipt,
    r_submitted,
    r_resolved,
    u_id_author,
    u_id_resolver,
    rt_type,
    rt_status
) VALUES (
    0,
    200,
    'I need my money back.',
    null,
    SYSDATE + 1,
    SYSDATE + 1,
    0,
    0,
    0,
    0
);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ers_users (
    u_id,
    u_username,
    u_password,
    u_firstname,
    u_lastname,
    u_email,
    ur_id
) VALUES (
    0,
    'username',
    'password',
    'firstname',
    'lastname',
    'test@gmail.com',
    0
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ers_user_roles (
    ur_id,
    ur_role
) VALUES (
    0,
    'employee'
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ers_reimbursement_type (
    rt_id,
    rt_type
) VALUES (
    0,
    'reimbursementType'
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ers_reimbursement_status (
    rs_id,
    rs_status
) VALUES (
    0,
    'rs_status'
);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
