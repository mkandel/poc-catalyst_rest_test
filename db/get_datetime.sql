-- select distinct record_created,last_updated from machinedb.machine;
-- select last_updated from machinedb.machine order by last_updated;
select last_updated from machinedb.machine group by last_updated;
