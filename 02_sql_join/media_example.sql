# mos 테이블에서 snd_cd와 sns_url값이 null이 아니고 mo 테이블에서 owner_nick_nm와 owner_id가 null이 아닌 경우에 대해서 하나만 선택
SELECT mo.owner_seqno, owner_id, owner_nick_nm
FROM tmon_media.media_owner AS mo
       INNER JOIN (select * from tmon_media.media_owner_sns where sns_cd IS NOT NULL
                                                              and sns_url IS NOT NULL GROUP BY owner_seqno HAVING COUNT(owner_seqno) > 1) AS mos
         ON mo.owner_seqno = mos.owner_seqno
WHERE owner_nick_nm IS NOT NULL
  AND owner_id IS NOT NULL
  AND use_yn = 'Y'
LIMIT 1;