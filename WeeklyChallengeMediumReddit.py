# SJSU Data Science Club
# Week 3 Coding Challenge (Medium difficulty):
#       Download the top 10 posts from r/aww using reddits api or PRAW.
#       Be able to print out the titles and the # of comments. 
# Submission by Terry Tzeng
import praw

# Create a Reddit instance
reddit = praw.Reddit(client_id='0K4lp1Q43hOX2g',
                     client_secret='wq_xanFFt47fpUXT4BRrid1SMqk',
                     user_agent='testscript by /u/terrysjsudsc',
                     username='terrysjsudsc')

# Create a subreddit instance from "aww"
subreddit = reddit.subreddit('aww')

# From subreddit instance "aww", grab top 10 posts
topPosts = subreddit.top(limit=10)

# Iterate through top 10 posts: print title & number of comments
for submission in topPosts:
    print(submission.title)
    print(submission.num_comments)