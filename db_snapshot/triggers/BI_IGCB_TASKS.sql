
  CREATE OR REPLACE EDITIONABLE TRIGGER "IRM_POC"."BI_IGCB_TASKS"
    before insert on IGCB_TASKS
    for each row
    begin
      if :new.id is null then
          select igcb_tasks_seq.nextval into :new.id from sys.dual;
     end if;
    end;
ALTER TRIGGER "IRM_POC"."BI_IGCB_TASKS" ENABLE

