-- 문제1 : 열 전체 값을 변경하기
update tmon_media.media_info_live set video_rt = 'P' where media_seqno > 1;

-- 문제2 : 여러 row에서 같은 column의 값을 변경하기
-- 이슈 : update query - You can't specify target table 'tasks' for update in FORM clause
update tmon_media.media_info_live as t1
set t1.video_rt = 'P'
where t1.media_seqno in (select t2.media_seqno from tmon_media.media_info_live as t2 where t2.create_tm < '2017-08-18 12:00:00');

-- #해결1 - 해결함
update tmon_media.media_info_live as t1
set t1.video_rt = 'P'
where t1.media_seqno in (select * from (select media_seqno from tmon_media.media_info_live where update_tm < '2019-08-14 12:00:00') as t2);



-- #문제 update query - You can't specify target table 'tasks' for update in FORM clause
update tasks
SET completed_form = 'y' AND all_forms_in = 'y'
where EID in (select EID from tasks WHERE completed_form = 'y'
                                      AND all_forms_in = 'n' group by EID having count(*) > 1);

#해결1 - wrapped the query in another select it works
update tasks
SET all_forms_in = 'y'
where EID in (SELECT * FROM (select EID from tasks WHERE completed_form = 'y'
                                                     AND all_forms_in = 'n' group by EID having count(*) > 1)AS b);

#해결2 - join
UPDATE tasks AS t1
INNER JOIN tasks AS t2
ON (t1.EID = t2.EID AND t2.completed_form = 'y' AND t2.all_forms_in = 'n')
INNER JOIN tasks AS t3
ON (t1.EID = t3.EID AND t3.completed_form = 'y' AND t3.all_forms_in = 'n'
    AND t2.primary_key <> t3.primary_key)
SET t1.completed_form = 'y',
    t1.all_forms_in   = 'y';