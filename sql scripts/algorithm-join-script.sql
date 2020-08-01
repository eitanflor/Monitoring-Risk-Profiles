CREATE TABLE #temptable 
             ( 
                          reference_number NVARCHAR(50), 
                          capacity         NVARCHAR(50), 
                          facility         NVARCHAR(50), 
                          campus           NVARCHAR(50) 
             )DECLARE @i INT = 0, 
  @count   INT = 0;SELECT @count = Count() 
FROM   ( 
                SELECT   reference_number 
                FROM     [capacity data] 
                GROUP BY reference_number 
                HAVING   Count() > 1 ) sub1WHILE @i <= @count 
BEGIN 
  INSERT INTO #temptable 
  SELECT TOP(1) 
           reference_number, 
           capacity, 
           facility, 
           campus 
  FROM     [Capacity Data] 
  WHERE    reference_number = 
           ( 
                    SELECT   reference_number 
                    FROM     [Capacity Data] 
                    GROUP BY reference_number 
                    HAVING   Count() > 1 
                    ORDER BY reference_number offset 0+@i rows 
                    FETCH next 1 rows only ) 
  ORDER BY try_convert(int, reference_number), 
           try_convert(int, capacity) DESC; 
   
  SET @i = @i + 1 
ENDSELECT DISTINCT s.academic_year, 
                s.semester, 
                s.reference_number, 
                s.course, 
                s.section, 
                s.course_name, 
                s.department, 
                s.[Day], 
                s.credit, 
                s.[Start_Date], 
                s.end_date, 
                s.time, 
                s.enrollment, 
                Substring(s.course, 1,3) AS 'Subject', 
                Substring(s.course, 4,4) AS 'Level', 
                sub1.capacity, 
                sub1.campus, 
                sub1.facility 
FROM            [Scheduling Data] S 
JOIN 
                ( 
                       SELECT 
                       from   #temptable 
                       UNION 
                       SELECT reference_number, 
                              capacity, 
                              facility, 
                              campus 
                       FROM   [Capacity Data] 
                       WHERE  reference_number IN 
                              ( 
                                       SELECT   reference_number 
                                       FROM     [Capacity Data] 
                                       GROUP BY reference_number 
                                       HAVING   Count(*) = 1 ) ) sub1 
ON              sub1.reference_number = s.reference_number 
WHERE           s.academic_year = '2020-2021' 
AND             s.enrollment !=