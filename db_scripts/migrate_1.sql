ALTER TABLE singer RENAME TO musician;

ALTER TABLE musician
CHANGE COLUMN singerName musicianName VARCHAR(50);

ALTER TABLE musician
ADD COLUMN role VARCHAR(50),
ADD COLUMN bandName VARCHAR(50);

UPDATE musician
SET role = CASE 
                WHEN musicianName = 'Alina' THEN 'vocals'
                WHEN musicianName = 'Mysterio' THEN 'guitar'
                WHEN musicianName = 'Rainbow' THEN 'percussion'
                WHEN musicianName = 'Luna' THEN 'piano'
                ELSE NULL
           END,
    bandName = CASE 
                WHEN musicianName IN ('Alina', 'Rainbow') THEN 'Crazy Duo'
                WHEN musicianName = 'Mysterio' THEN 'Mysterio'
                WHEN musicianName = 'Luna' THEN 'Luna'
                ELSE NULL
               END;

CREATE TABLE band (
    bandName VARCHAR(50) PRIMARY KEY,
    creation YEAR,
    genre VARCHAR(50)
);

INSERT INTO band (bandName, creation, genre)
VALUES
    ('Crazy Duo', 2015, 'rock'),
    ('Luna', 2009, 'classical'),
    ('Mysterio', 2019, 'pop');