---- ideas coming from the followig links/resources:
-- https://dzone.com/articles/generating-millions-of-rows-in-sql-server
-- https://www.brentozar.com/archive/2015/05/how-to-fake-load-tests-with-sqlquerystress/
-- https://gist.github.com/BrentOzar/12b8ac33a67f02f413d30529caff5676
-- https://github.com/leerssej/SEDESchema/blob/master/info_schema_create_tables.sql


use [master]
CREATE DATABASE [db4]
 CONTAINMENT = NONE
GO

USE [db4]
GO

CREATE TABLE [dbo].[Posts](
	[Id] [int] NOT NULL identity,
	[PostTypeId] [tinyint] NOT NULL,
	[AcceptedAnswerId] [int] NULL,
	[ParentId] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[DeletionDate] [datetime] NULL,
	[Score] [int] NOT NULL,
	[ViewCount] [int] NULL,
	[Body] [nvarchar](800) NULL,
	[OwnerUserId] [int] NULL,
	[OwnerDisplayName] [nvarchar](40) NULL,
	[LastEditorUserId] [int] NULL,
	[LastEditorDisplayName] [nvarchar](40) NULL,
	[LastEditDate] [datetime] NULL,
	[LastActivityDate] [datetime] NULL,
	[Title] [nvarchar](250) NULL,
	[Tags] [nvarchar](250) NULL,
	[AnswerCount] [int] NULL,
	[CommentCount] [int] NULL,
	[FavoriteCount] [int] NULL,
	[ClosedDate] [datetime] NULL,
	[CommunityOwnedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL identity,
	[Reputation] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[DisplayName] [nvarchar](40) NULL,
	[LastAccessDate] [datetime] NOT NULL,
	[WebsiteUrl] [nvarchar](200) NULL,
	[Location] [nvarchar](100) NULL,
	[AboutMe] [nvarchar](800) NULL,
	[Views] [int] NOT NULL,
	[UpVotes] [int] NOT NULL,
	[DownVotes] [int] NOT NULL,
	[ProfileImageUrl] [nvarchar](200) NULL,
	[EmailHash] [varchar](32) NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Votes](
	[Id] [int] NOT NULL identity,
	[PostId] [int] NOT NULL,
	[VoteTypeId] [tinyint] NOT NULL,
	[UserId] [int] NULL,
	[CreationDate] [datetime] NULL,
	[BountyAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECT_ID ('dbo.addRowsPosts', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsPosts;

GO

CREATE PROCEDURE dbo.addRowsPosts 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @posttypeid INT = (CAST(RAND()*1000 AS INT)%255)+1

            DECLARE @acceptedanswerid INT = CAST(RAND()*1000 AS INT)

            DECLARE @parentid INT = CAST(RAND()*1000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, 0-CAST(RAND()*1000 AS INT), getdate())

            DECLARE @deletion_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), @creation_date)
            
            DECLARE @score INT = CAST(RAND()*100 AS INT)

            DECLARE @viewcount INT = CAST(RAND()*10000 AS INT)

            DECLARE @owneruserid INT = CAST(RAND()*100000 AS INT)

            DECLARE @lasteditoruserid INT = CAST(RAND()*100000 AS INT)

            DECLARE @lastedit_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @lastactivity_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @answercount int = CAST(RAND()*10000 AS INT)

            DECLARE @commentcount int = CAST(RAND()*100000 AS INT)

            DECLARE @favoritecount int = CAST(RAND()*10000 AS INT)

            DECLARE @closed_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @communityowned_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @body NVARCHAR(150) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 150 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @body = @body + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @ownerdisplayname NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @ownerdisplayname = @ownerdisplayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @lasteditordisplayname NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @lasteditordisplayname = @lasteditordisplayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @title NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @title = @title + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @tags NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @tags = @tags + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Posts
			VALUES (--@id,
				@posttypeid, @acceptedanswerid, @parentid, @creation_date, @deletion_date, @score
                , @viewcount, @body, @owneruserid, @ownerdisplayname, @lasteditoruserid, @lasteditordisplayname, @lastedit_date
                , @lastactivity_date, @title, @tags, @answercount, @commentcount, @favoritecount, @closed_date, @communityowned_date)

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO

IF OBJECT_ID ('dbo.addRowsUsers', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsUsers;

GO

CREATE PROCEDURE dbo.addRowsUsers 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @reputation INT = CAST(RAND()*10000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, 0-CAST(RAND()*1000 AS INT), getdate())

            DECLARE @lastaccess_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), @creation_date)
            
            DECLARE @views INT = CAST(RAND()*10000 AS INT)

            DECLARE @upvotes INT = CAST(RAND()*1000 AS INT)

            DECLARE @downvotes INT = CAST(RAND()*1000 AS INT) 

            DECLARE @accountid INT = CAST(RAND()*10000 AS INT)

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @displayname NVARCHAR(30) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @displayname = @displayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @emailhash NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @emailhash = @emailhash + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Users
			VALUES (--@id, 
				@reputation, @creation_date, @displayname, @lastaccess_date
                , null, null, null, @views, @upvotes, @downvotes, null
                , @emailhash, @accountid)

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO

IF OBJECT_ID ('dbo.addRowsVotes', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsVotes;

GO

CREATE PROCEDURE dbo.addRowsVotes 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @postid INT = CAST(RAND()*1000000 AS INT)

            DECLARE @votetypeid INT = (CAST(RAND()*1000 AS INT)%255)+1

            DECLARE @userid INT = CAST(RAND()*10000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), getdate())
            
            DECLARE @bountyamount INT = CAST(RAND()*10000 AS INT)

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @displayname NVARCHAR(30) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @displayname = @displayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @emailhash NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @emailhash = @emailhash + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Votes
			VALUES (--@id, 
				@postid, @votetypeid, @userid, @creation_date, @bountyamount
                )

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO



IF OBJECT_ID('dbo.usp_Q7521') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q7521 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q7521 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/7521/how-unsung-am-i */
select cast(year(creationdate) as varchar) + '-' + cast(MONTH(CreationDate) as varchar)
, count(*) as cnt
, count(distinct a.OwnerDisplayName) as cnt_owner
, count(a.Id) as [Accepted Answers],
    sum(case when a.Score = 0 then 0 else 1 end) as [Scored Answers],  
    sum(case when a.Score = 0 then 1 else 0 end) as [Unscored Answers],
    sum(CASE WHEN a.Score = 0 then 1 else 0 end)*1000 / case when count(a.Id) = 0 then 1 end / 10.0 as [Percentage Unscored]
from posts a
group by cast(year(creationdate) as varchar) + '-' + cast(MONTH(CreationDate) as varchar)
;
END
GO


IF OBJECT_ID('dbo.usp_Q36660') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q36660 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q36660 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/36660/most-down-voted-questions */
select count(v.PostId) as 'Vote count', v.PostId AS [Post Link],p.Body
from Votes v 
inner join Posts p on p.Id=v.PostId
group by v.PostId,p.Body
order by 'Vote count' desc

END
GO


IF OBJECT_ID('dbo.usp_Q949') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q949 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q949 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/949/what-is-my-accepted-answer-percentage-rate */

SELECT 
    q.id, a.id,
	(CAST(Count(a.Id)  over(partition by q.id) AS float) / (SELECT Count(*) FROM Posts) * 100) AS AcceptedPercentage
FROM
    Posts q
  INNER JOIN
    Posts a ON q.AcceptedAnswerId = a.Id
group by q.id, a.id

END
GO




IF OBJECT_ID('dbo.usp_Q3160') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q3160 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q3160 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/3160/jon-skeet-comparison */

with fights as (
  select myAnswer.ParentId as Question,
   myAnswer.Score as MyScore,
   jonsAnswer.Score as JonsScore
  from Posts as myAnswer
  inner join Posts as jonsAnswer
   on jonsAnswer.OwnerUserId = 22656 and myAnswer.ParentId = jonsAnswer.ParentId
  --where myAnswer.OwnerUserId = @UserId and myAnswer.PostTypeId = 2
)

select
  case
   when MyScore > JonsScore then 'You win'
   when MyScore < JonsScore then 'Jon wins'
   else 'Tie'
  end as 'Winner',
  Question as [Post Link],
  MyScore as 'My score',
  JonsScore as 'Jon''s score'
from fights;
END
GO





IF OBJECT_ID('dbo.usp_Q6772') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q6772 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q6772 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/6772/stackoverflow-rank-and-percentile */

WITH Rankings AS (
SELECT Id, Ranking = ROW_NUMBER() OVER(ORDER BY Reputation DESC)
FROM Users
)
,Counts AS (
SELECT Count = COUNT(*)
FROM Users
WHERE Reputation > 100
)
SELECT Id, Ranking, CAST(Ranking AS decimal(20, 5)) / (SELECT Count FROM Counts) AS Percentile
FROM Rankings

END
GO









IF OBJECT_ID('dbo.usp_Q6856') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q6856 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q6856 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/6856/high-standards-top-100-users-that-rarely-upvote */

select 
  Id as [User Link],
  round((100.0 * (Reputation/10)) / (UpVotes+1), 2) as [Ratio %],
  Reputation as Rep, 
  UpVotes as [+ Votes],
  DownVotes [- Votes]
from Users
order by [Ratio %] desc


END
GO




IF OBJECT_ID('dbo.usp_Q952') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q952 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q952 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/952/top-500-answerers-on-the-site */

SELECT 
 
    Users.Id as [User Link],
    Count(Posts.Id) AS Answers,
    CAST(AVG(CAST(Score AS float)) as numeric(6,2)) AS [Average Answer Score]
FROM
    Posts
  INNER JOIN
    Users ON Users.Id = OwnerUserId
GROUP BY
    Users.Id, DisplayName
ORDER BY
    [Average Answer Score] DESC

END
GO







IF OBJECT_ID('dbo.usp_Q975') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_Q975 AS RETURN 0;')
GO

ALTER PROC dbo.usp_Q975 AS
BEGIN
/* Source: http://data.stackexchange.com/stackoverflow/query/975/users-with-more-than-one-duplicate-account-and-a-more-than-1000-reputation-in-agg */

-- Users with more than one duplicate account and a more that 1000 reputation in aggregate
-- A list of users that have duplicate accounts on site, based on the EmailHash and lots of reputation is riding on it
SELECT 
    u1.EmailHash,
    Count(u1.Id) AS Accounts,
    (
        SELECT Cast(u2.Id AS varchar) + ' (' + u2.DisplayName + ' ' + Cast(u2.Reputation as varchar) + '), ' 
        FROM Users u2 
        WHERE u2.EmailHash = u1.EmailHash order by u2.Reputation desc FOR XML PATH ('')) AS IdsAndNames
FROM
    Users u1
WHERE
    u1.EmailHash IS NOT NULL
    and (select sum(u3.Reputation) from Users u3 where u3.EmailHash = u1.EmailHash) > 1000  
    and (select count(*) from Users u3 where u3.EmailHash = u1.EmailHash and Reputation > 10) > 1
GROUP BY
    u1.EmailHash
HAVING
    Count(u1.Id) > 1
ORDER BY 
    Accounts DESC

END
GO






IF OBJECT_ID('dbo.usp_RandomQ') IS NULL
  EXEC ('CREATE PROCEDURE dbo.usp_RandomQ AS RETURN 0;')
GO

ALTER PROCEDURE dbo.usp_RandomQ @query_count INT WITH RECOMPILE
AS

DECLARE @iteration INT = 0;

while @iteration <  @query_count
begin
/* Source: https://gist.github.com/BrentOzar/12b8ac33a67f02f413d30529caff5676 */
DECLARE @Id INT = CAST(RAND() * 10000000 AS INT);

IF @Id % 12 = 0
    EXEC dbo.usp_Q3160 ELSE IF @Id % 11 = 0
    EXEC dbo.usp_Q36660 ELSE IF @Id % 10 = 0
    EXEC dbo.usp_Q6772 ELSE IF @Id % 9 = 0
    EXEC dbo.usp_Q6856 ELSE IF @Id % 8 = 0
    EXEC dbo.usp_Q7521 ELSE IF @Id % 7 = 0
    EXEC dbo.usp_Q949 ELSE IF @Id % 6 = 0
    EXEC dbo.usp_Q952 ELSE IF @Id % 5 = 0
	EXEC dbo.usp_Q975 ELSE IF @Id % 4 = 0
	EXEC dbo.addRowsPosts 10000 ELSE IF @Id % 3 = 0
	EXEC dbo.addRowsVotes 10000
	ELSE IF @Id % 2 = 0 EXEC dbo.addRowsUsers 1000

SET @iteration += 1
end

GO


EXEC dbo.addRowsPosts 200000;
GO
EXEC dbo.addRowsUsers 10000;
GO
EXEC dbo.addRowsVotes 100000;
GO
EXEC dbo.usp_RandomQ 100;
GO



EXEC dbo.usp_RandomQ 100;