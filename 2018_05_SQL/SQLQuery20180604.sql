
select[�Юv�N��],[�Юv�m],[�Юv�W],[�~��]
from [dbo].[�Юv]
where [�~��]>60000
order by [�~��] desc
 
 
select count(*)as �H��
from [dbo].[�Юv]
where [�~��]>60000
 
select count([dbo].[�ҵ{].[�ҵ{�N��])as �}�Ҽ�,[dbo].[�Юv].[�Юv�N��],[dbo].[�Юv].[�Юv�m],[dbo].[�Юv].[�Юv�W]
from [dbo].[�ҵ{] , [dbo].[�Юv]
where [dbo].[�Юv].�Юv�N��=[dbo].[�ҵ{].�Юv�N�� --is not null--> could be used in single data sheet 
group by [dbo].[�Юv].�Юv�N��,[dbo].[�Юv].[�Юv�m],[dbo].[�Юv].[�Юv�W]
 
 
select [dbo].[�ǥ�].[�ǥͥN��],[dbo].[�ǥ�].[�ǥͩm],[dbo].[�ǥ�].[�ǥͦW],avg([dbo].[���].[�׽Ҧ��Z])as ��������
from[dbo].[�ǥ�],[dbo].[���],[dbo].[�ҵ{]
where [dbo].[�ǥ�].[�ǥͥN��]=[dbo].[���].[�ǥͥN��]
group by [dbo].[�ǥ�].[�ǥͥN��],[dbo].[�ǥ�].[�ǥͩm],[dbo].[�ǥ�].[�ǥͦW]
 
select [dbo].[�ҵ{].[�ҵ{�N��],count([dbo].[���].[�ǥͥN��])as ��פH��
from[dbo].[�ҵ{],[dbo].[���]
where [dbo].[���].[�ҵ{�N��]=[dbo].[�ҵ{].[�ҵ{�N��] and
[dbo].[�ҵ{].[�}�Ҧ~��]=2003
group by [dbo].[�ҵ{].[�ҵ{�N��]
 
select [dbo].[�ǥ�].[�ǥͥN��],[dbo].[�ǥ�].[�ǥͩm],[dbo].[�ǥ�].[�ǥͦW],count([dbo].[���].[�ҵ{�N��])as �׽Ҽƥ�
from[dbo].[�ҵ{],[dbo].[���],[dbo].[�ǥ�]
where [dbo].[���].[�ҵ{�N��]=[dbo].[�ҵ{].[�ҵ{�N��] and
[dbo].[���].[�ǥͥN��]=[dbo].[�ǥ�].[�ǥͥN��] and
[dbo].[�ҵ{].[�}�Ҧ~��]=2003
group by [dbo].[�ǥ�].[�ǥͥN��],[dbo].[�ǥ�].[�ǥͩm],[dbo].[�ǥ�].[�ǥͦW]
having count([dbo].[���].[�ҵ{�N��])<3
order by �׽Ҽƥ� desc
 
select [dbo].[�ǥ�].[�ǥͥN��],[dbo].[�ǥ�].[�ǥͩm],[dbo].[�ǥ�].[�ǥͦW],[dbo].[�ǥ�].[����],
[dbo].[�ǥ�].[�{],[dbo].[�ǥ�].[�l���ϸ�],[dbo].[�ǥ�].[�D�׬��],[dbo].[�ǥ�].[�Z��],[dbo].[�ǥ�].[�`���Z����]
from[dbo].[�ǥ�]
where [dbo].[�ǥ�].[�`���Z����]>
								(select avg([dbo].[�ǥ�].[�`���Z����]) from [dbo].[�ǥ�])
order by [dbo].[�ǥ�].[�`���Z����] desc
 
--select avg([dbo].[�ǥ�].[�`���Z����]) as average_score from [dbo].[�ǥ�]