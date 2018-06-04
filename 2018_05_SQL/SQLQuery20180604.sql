
select[教師代號],[教師姓],[教師名],[薪資]
from [dbo].[教師]
where [薪資]>60000
order by [薪資] desc
 
 
select count(*)as 人數
from [dbo].[教師]
where [薪資]>60000
 
select count([dbo].[課程].[課程代號])as 開課數,[dbo].[教師].[教師代號],[dbo].[教師].[教師姓],[dbo].[教師].[教師名]
from [dbo].[課程] , [dbo].[教師]
where [dbo].[教師].教師代號=[dbo].[課程].教師代號 --is not null--> could be used in single data sheet 
group by [dbo].[教師].教師代號,[dbo].[教師].[教師姓],[dbo].[教師].[教師名]
 
 
select [dbo].[學生].[學生代號],[dbo].[學生].[學生姓],[dbo].[學生].[學生名],avg([dbo].[選修].[修課成績])as 平均分數
from[dbo].[學生],[dbo].[選修],[dbo].[課程]
where [dbo].[學生].[學生代號]=[dbo].[選修].[學生代號]
group by [dbo].[學生].[學生代號],[dbo].[學生].[學生姓],[dbo].[學生].[學生名]
 
select [dbo].[課程].[課程代號],count([dbo].[選修].[學生代號])as 選修人數
from[dbo].[課程],[dbo].[選修]
where [dbo].[選修].[課程代號]=[dbo].[課程].[課程代號] and
[dbo].[課程].[開課年份]=2003
group by [dbo].[課程].[課程代號]
 
select [dbo].[學生].[學生代號],[dbo].[學生].[學生姓],[dbo].[學生].[學生名],count([dbo].[選修].[課程代號])as 修課數目
from[dbo].[課程],[dbo].[選修],[dbo].[學生]
where [dbo].[選修].[課程代號]=[dbo].[課程].[課程代號] and
[dbo].[選修].[學生代號]=[dbo].[學生].[學生代號] and
[dbo].[課程].[開課年份]=2003
group by [dbo].[學生].[學生代號],[dbo].[學生].[學生姓],[dbo].[學生].[學生名]
having count([dbo].[選修].[課程代號])<3
order by 修課數目 desc
 
select [dbo].[學生].[學生代號],[dbo].[學生].[學生姓],[dbo].[學生].[學生名],[dbo].[學生].[城市],
[dbo].[學生].[州],[dbo].[學生].[郵遞區號],[dbo].[學生].[主修科目],[dbo].[學生].[班級],[dbo].[學生].[總成績等級]
from[dbo].[學生]
where [dbo].[學生].[總成績等級]>
								(select avg([dbo].[學生].[總成績等級]) from [dbo].[學生])
order by [dbo].[學生].[總成績等級] desc
 
--select avg([dbo].[學生].[總成績等級]) as average_score from [dbo].[學生]