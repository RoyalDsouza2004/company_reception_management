CREATE TABLE Admin(
  id VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(20),
  Email VARCHAR(20) ,
  password VARCHAR(20) NOT NULL
);

CREATE TABLE Staff (
  ID INT PRIMARY KEY,
  Name VARCHAR(20) NOT NULL,
  Email VARCHAR(20),
  Phone_Number BIGINT NOT NULL,
  Role VARCHAR(20),
  Department VARCHAR(20)
);

CREATE TABLE Visitor (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(20) NOT NULL,
  Email VARCHAR(20),
  Phone_Number BIGINT ,
  Purpose_of_Visit VARCHAR(30),
  Date_Time_of_Visit DATETIME ,
  Staff_Member_Met INT,
  FOREIGN KEY(Staff_Member_Met) REFERENCES Staff(ID) ON DELETE CASCADE
);

CREATE TABLE Appointment (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Date_Time DATETIME NOT NULL,
  Visitor_ID INT ,
  Staff_Member_ID INT NOT NULL,
  Purpose VARCHAR(20),
  Booking_Status ENUM('Pending', 'Approved', 'Cancelled') DEFAULT 'Pending',
  CONSTRAINT unique_appointment UNIQUE (Visitor_ID, Staff_Member_ID, Date_Time),
  FOREIGN KEY(Staff_Member_ID) REFERENCES Staff(ID) ON DELETE CASCADE,
  FOREIGN KEY(Visitor_ID) REFERENCES Visitor(ID) ON DELETE CASCADE
);


CREATE TABLE Package (
  Tracking_Number INT PRIMARY KEY,
  Sender_ID INT ,
  Recipient_ID INT ,
  Description VARCHAR(30),
  Delivery_Date_Time DATETIME,
  Status ENUM('Received', 'Delivered', 'Lost') DEFAULT 'Received',
  FOREIGN KEY(Sender_ID) REFERENCES Visitor(ID) ON DELETE CASCADE,
  FOREIGN KEY(Sender_ID) REFERENCES Staff(ID) ON DELETE CASCADE, 
  FOREIGN KEY(Recipient_ID) REFERENCES Visitor(ID) ON DELETE CASCADE,
  FOREIGN KEY(Recipient_ID) REFERENCES Staff(ID) ON DELETE CASCADE 
);


CREATE TABLE Message (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Sender_ID INT NOT NULL,
  Recipient_ID INT NOT NULL,
  Content TEXT,
  Date_Time_Received DATETIME NOT NULL,
  Delivery_Status ENUM('Sent', 'Delivered', 'Read') DEFAULT 'Sent',
  FOREIGN KEY(Sender_ID) REFERENCES Visitor(ID) ON DELETE CASCADE,
  FOREIGN KEY(Sender_ID) REFERENCES Staff(ID) ON DELETE CASCADE, 
  FOREIGN KEY(Recipient_ID) REFERENCES Visitor(ID) ON DELETE CASCADE,
  FOREIGN KEY(Recipient_ID) REFERENCES Staff(ID) ON DELETE CASCADE 
);

