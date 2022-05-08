-- Json string manipulation

-- JSON_QUERY
WITH
  yourTable AS (
  SELECT
    '{"menu":{"id":"file","value":"File","popup":{"menuitem":[{"value":"New","onclick":"CreateNewDoc()"},{"value":"Open","onclick":"OpenDoc()"},{"value":"Close","onclick":"CloseDoc()"}]}}}' AS subscriptions )
SELECT
  JSON_QUERY(subscriptions,
    '$.menu.popup.menuitem')
FROM
  yourTable
  
-- result:  [{"value":"New","onclick":"CreateNewDoc()"},{"value":"Open","onclick":"OpenDoc()"},{"value":"Close","onclick":"CloseDoc()"}] 
 
 
-- JSON_VALUE
 WITH yourTable AS (
  SELECT '{"menu":{"id":"file","value":"File","popup":{"menuitem":[{"value":"New","onclick":"CreateNewDoc()"},{"value":"Open","onclick":"OpenDoc()"},{"value":"Close","onclick":"CloseDoc()"}]}}}'
  AS subscriptions
)
SELECT JSON_VALUE(subscriptions, '$.menu.popup.menuitem[0].value') from yourTable

-- result:  New 