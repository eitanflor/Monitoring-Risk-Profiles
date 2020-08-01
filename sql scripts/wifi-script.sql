SELECT * 
INTO   wifi_sessions 
FROM   (SELECT apname, 
               time_tiles, 
               Count(*) AS 'Traffic' 
        FROM   (SELECT sub1.*, 
                       Ntile (24) 
                         OVER ( 
                           ORDER BY time ) time_tiles 
                FROM   (SELECT WBA.*, 
                               'BA' AS 'Wifi Session' 
                        FROM   wifi_sessions_ba_jan1 WBA 
                        UNION 
                        SELECT WMA.*, 
                               'MANGO' AS 'Wifi Session' 
                        FROM   wifi_sessions_mango_jan1 WMA) sub1) sub2 
        GROUP  BY apname, 
                  time_tiles) sub3 

SELECT Ws.*, 
       SUB.[wifi session] 
FROM   wifi_sessions Ws 
       JOIN (SELECT DISTINCT apname, 
                             'BA' AS 'Wifi Session' 
             FROM   wifi_sessions_ba_jan1 
             UNION 
             SELECT DISTINCT apname, 
                             'MANGO' AS 'Wifi Session' 
             FROM   wifi_sessions_mango_jan1) sub 
         ON sub.apname = Ws.apname 