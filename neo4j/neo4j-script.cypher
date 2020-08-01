LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/zipcode.csv?token=AOL4NN2RSH2YEWXEST66TQC7F3NT4" AS row
CREATE (z:zipcode)
SET z = row

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/courses.csv?token=AOL4NN3KS42XZ5HW7EDZ3QS7F3NFI" AS row
CREATE (c:courses)
SET c = row

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/students.csv?token=AOL4NN32SZS6CCO2CVRS7M27F3NRI" AS row
CREATE (s:students)
SET s = row

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/faculty.csv?token=AOL4NNY2VU75PWIN4LCSGSC7F3NJE" AS row
CREATE (f:faculty)
SET f = row

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/enroll.csv?token=AOL4NN3SOAI2IBER5NOX34C7F3NLU" AS row
MATCH (s:students), (c:courses)
WHERE s.sid = row.sid
AND c.Reference_Number = row.Reference_Number
CREATE (s)-[:ENROLLS]->(c)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/eitanflor/Monitoring-Risk-Profiles/master/data/subset/instruct.csv?token=AOL4NNZGYFELMHWOWP2C5WC7F3NPY" AS row
MATCH (s:faculty), (c:courses)
WHERE s.sid = row.sid
AND c.Reference_Number = row.Reference_Number
CREATE (s)-[:TEACHES]->(c)

MATCH (s:students),(z:zipcode)
WHERE s.zipcode = z.zipcode
CREATE (s)-[:LIVES]->(z)

MATCH (s:faculty),(z:zipcode)
WHERE s.zipcode = z.zipcode
CREATE (s)-[:LIVES]->(z)