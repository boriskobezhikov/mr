CREATE TABLE ProcurementStatuses (
  ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  Name VARCHAR(256) NOT NULL
);

CREATE TABLE Providers
(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR(256) NOT NULL,
    Email VARCHAR(256) NOT NULL,
    ContactPerson VARCHAR(256) NOT NULL,
    Comments TEXT
);

CREATE TABLE SouvenirProcurements (
  ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  IdProvider INT NOT NULL REFERENCES Providers(ID),
  Data DATE NOT NULL,
  IdStatus INT NOT NULL REFERENCES ProcurementStatuses(ID)
);

CREATE TABLE Colors (
    ID BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR(200) NOT NULL
);

CREATE TABLE SouvenirsCategories (
    ID BIGINT PRIMARY KEY,
    IdParent BIGINT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE SouvenirMaterials (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(200) NOT NULL
);

CREATE TABLE ApplicationMethods (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(200) NOT NULL
);

CREATE TABLE Souvenirs (
    ID BIGINT PRIMARY KEY,                        
    URL VARCHAR(100) NOT NULL,                    
    ShortName VARCHAR(150) NOT NULL,              
    Name VARCHAR(200) NOT NULL,                   
    Description VARCHAR(2500) NOT NULL,           
    Rating SMALLINT NOT NULL,                     
    IdCategory BIGINT NOT NULL REFERENCES SouvenirsCategories(ID),
    IdColor BIGINT NOT NULL REFERENCES Colors(ID),  
    Size VARCHAR(150) NOT NULL,                   
    IdMaterial INT NOT NULL REFERENCES SouvenirMaterials(ID), 
    Weight DECIMAL(10,3),                         
    QTypics VARCHAR(10),                          
    PicsSize VARCHAR(20),                         
    IdApplicMetod INT NOT NULL REFERENCES ApplicationMethods(ID), 
    AllCategories VARCHAR(150) NOT NULL,          
    DealerPrice DECIMAL(10,2) NOT NULL,           
    Price DECIMAL(10,2) NOT NULL,                 
    Comments VARCHAR(1000)                        
);

CREATE TABLE SouvenirStores (
    ID BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,                         
    IdSouvenir BIGINT NOT NULL REFERENCES Souvenirs(ID), 
    IdProcurement INT NOT NULL REFERENCES SouvenirProcurements(ID),
    Amount INT NOT NULL,                            
    Comments VARCHAR(1000)                          
);

CREATE TABLE ProcurementSouvenirs (
    ID BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,                          
    IdSouvenir BIGINT NOT NULL REFERENCES Souvenirs(ID),
    IdProcurement INT NOT NULL REFERENCES SouvenirProcurements(ID), 
    Amount INT NOT NULL,                            
    Price DECIMAL(10,2) NOT NULL                    
);

