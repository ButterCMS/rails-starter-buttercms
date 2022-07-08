## Local Configuration and Token

- [x] Readme is placed in repo and uses language from the sample readme from
      the front-end asset respository.
- [x] User can follow readme and run locally from the terminal in < 5 mins
- [x] Locally run project uses the provided favicon.
- [x] Starter project uses best practices for managing and accessing environment
      variables, including Butter token (generally by storing in an .env file).
- [x] If value for Butter token is present in .env file but set to an invalid
      value, navigating to any page in the local version displays a 404 page.
      Additionally, the following error is logged to console: "Your Butter token
      is set to an invalid value. Please verify your token is correct."
- [x] Instructions on error hero for missing API token has been updated to fit
      current framework.
- [x] "Get your free API token" button on error hero links to https://buttercms.com/join/

## Navigation menu

- [x] Navigation menu is pulled into project via two API calls. Updates to the navigation
      menu in Butter also change the navigation menu in the starter project (although
      these updates will not be initially necessary for the customer.)
      !!!NOTE: I only needed one API call

## Index View

- [x] Route is set to "/"
- [x] Secondary route is set to /landing-page/<slug> to enable previewing in ButterCMS.com
      iframe panel, as iframe panel does not currently explicitly allow previewing of index.
- [x] Page view connects to "landing-page-with-components" page type in Butter.
- [x] Automatically detects if API token is configured and displays error hero
      from front end templates if not.
- [x] SEO details in page header update with changes to the SEO component from
      the landing-page-with-components Page in the customer's ButterCMS.com account.
- [x] All items in header menu smooth scroll to appropriate content section.
- [x] All items in footer menu smooth scroll to appropriate content section.
- [x] Blue "Need an account?" link is set to open https://buttercms.com/join/ in a new tab.
- [x] All "Update this Page in Butter" link to https://buttercms.com/pages/ in a new tab.
- [x] "What our customers say" testimonial slider auto-starts.
- [x] Clicking buttons in "What our customers say" slider moves slides left and right.
- [x] "Latest Blog Posts" section shows up to two cards containing the customer's
      two most recent blog posts in ButterCMS.com.
- [x] "View All Blog Posts" button on main page links to Blog main view (list view).
- [x] Title on each blog card links to blog post detail view.
- [x] "Read More" Button on each blog card links to blog post detail view.
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.
- [x] _Draft_ changes of the landing-page-with-components Page in buttercms.com are
      displayed locally according to the given specifications for that individual framework.

## Blog Main View

- [x] Route is set to /blog/
- [x] Detects if API token is configured and displays error hero if not.
- [x] SEO title reads: "Sample Blog - All Posts"
- [x] SEO description reads: "Sample blog powered by ButterCMS, showing all posts."
- [x] All items in header menu link to appropriate content section in main view.
- [x] All items in footer menu link to appropriate content section in main view.
- [x] Title above breadcrumb menu says "All Blog Posts"
- [x] Breadcrumb menu displays "Home" > All Blog Posts.
- [x] "Home" in breadcrumb menu links back to index view.
- [x] All categories appear in category widget area and update with changes.
- [x] Clicking on a category routes to the blog category view for that category.
- [x] Posts display and include titles, author, author image, readable date/time,
      tags, and featured image.
- [x] Post titles, featured images, author, author image, date, and tags update
      with changes to posts.
- [x] Placeholder avatar used if no avatar in customer's Butter account.
- [x] Clicking a tag routes to the appropriate blog tag view for that tag.
- [x] Title on each blog card links to blog post detail view.
- [x] "Read More" Button on each blog card links to blog post detail view.
- [x] Search widget area is functional. Typing a search term into the box and clicking on
      magnifying glass icon routes to blog search view for that term.
- [x] Searching for a term that does not exist in the customer's ButterCMS.com posts
      returns the message "No blog posts found matching this query."
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.
- [x] _Draft_ changes to blog posts in buttercms.com are displayed locally according
      to the given specifications for that individual framework.

## Blog Categories View

- [x] Route is set to /blog/category/<category-slug>/
- [x] Detects if API token is configured and displays error hero if not.
- [x] SEO title reads: "Sample Blog - category: _category <category title>_"
- [x] SEO description reads: "Sample blog powered by ButterCMS, showing category: <category title>."
- [x] All items in header menu link to appropriate content section in main view.
- [x] All items in footer menu link to appropriate content section in main view.
- [x] Title above breadcrumb menu says "Blog Posts By Category"
- [x] Breadcrumb menu displays "Home" > "Blog" > "Category: <category name>".
- [x] "Home" in breadcrumb menu links back to starter project index view.
- [x] "Blog" in breadcrumb menu links back to blog list view.
- [x] All categories appear in category widget area and update with changes.
- [x] Clicking on a category routes to the blog category view for that category.
- [x] Posts display and include titles, author, author image, readable date/time,
      tags, and featured image.
- [x] Post titles, featured images, author, author image, date, and tags update
      with changes to posts.
- [x] Placeholder avatar used if no avatar in customer's Butter account.
- [x] Clicking a tag routes to the appropriate blog tag view for that tag.
- [x] Title on each blog card links to blog post detail view.
- [x] "Read More" Button on each blog card links to blog post detail view.
- [x] Search widget area is functional. Typing a search term into the box and clicking on
      magnifying glass icon routes to blog search view for that term.
- [x] Searching for a term that does not exist in the customer's ButterCMS.com posts
      returns the message "No blog posts found matching this query."
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.
- [x] _Draft_ changes to blog posts in buttercms.com are displayed locally according
      to the given specifications for that individual framework.

## Blog Tags View

- [x] Route is set to /blog/tag/<tag-slug>/
- [x] Detects if API token is configured and displays error hero if not.
- [x] SEO title reads: "Sample Blog - tag: _tag <tag title>_"
- [x] SEO description reads: "Sample blog powered by ButterCMS, showing tag: <tag title>."
- [x] All items in header menu link to appropriate content section in main view.
- [x] All items in footer menu link to appropriate content section in main view.
- [x] Title above breadcrumb menu says "Blog Posts by Tag"
- [x] Breadcrumb menu displays "Home" > "Blog" > "Tag: <tag name>".
- [x] "Home" in breadcrumb menu links back to starter project index view.
- [x] "Blog" in breadcrumb menu links back to blog list view.
- [x] All categories appear in category widget area and update with changes.
- [x] Clicking on a category routes to the blog category view for that category.
- [x] Posts display and include titles, author, author image, readable date/time,
      tags, and featured image.
- [x] Post titles, featured images, author, author image, date, and tags update
      with changes to posts.
- [x] Placeholder avatar used if no avatar in customer's Butter account.
- [x] Clicking a tag routes to the appropriate blog tag view for that tag.
- [x] Title on each blog card links to blog post detail view.
- [x] "Read More" Button on each blog card links to blog post detail view.
- [x] Search widget area is functional. Typing a search term into the box and clicking on
      magnifying glass icon routes to blog search view for that term.
- [x] Searching for a term that does not exist in the customer's ButterCMS.com posts
      returns the message "No blog posts found matching this query."
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.
- [x] _Draft_ changes to blog posts in buttercms.com are displayed locally according
      to the given specifications for that individual framework.

## Blog Search View

- [x] Route is set to /blog/search/?q=<query>/
- [x] Detects if API token is configured and displays error hero if not.
- [x] SEO title reads: "Sample Blog - search results for <query>"
- [x] SEO description reads: "Sample blog powered by ButterCMS, showing search results for query: "<search query>"."
- [x] All items in header menu link to appropriate content section in main view.
- [x] All items in footer menu link to appropriate content section in main view.
- [x] Title above breadcrumb menu says "Search Results"
- [x] Breadcrumb menu displays "Home" > "Blog" > "Search: <search term>".
- [x] "Home" in breadcrumb menu links back to starter project index view.
- [x] "Blog" in breadcrumb menu links back to blog list view.
- [x] All categories appear in category widget area and update with changes.
- [x] Clicking on a category routes to the blog category view for that category.
- [x] Posts display and include titles, author, author image, readable date/time,
      tags, and featured image.
- [x] Post titles, featured images, author, author image, date, and tags update
      with changes to posts.
- [x] Placeholder avatar used if no avatar in customer's Butter account.
- [x] Clicking a tag routes to the appropriate blog tag view for that tag.
- [x] Title on each blog card links to blog post detail view.
- [x] "Read More" Button on each blog card links to blog post detail view.
- [x] Search widget area is functional. Typing a search term into the box and clicking on
      magnifying glass icon routes to blog search view for that term.
- [x] Searching for a term that does not exist in the customer's ButterCMS.com posts
      returns the message "No blog posts found matching this query."
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.
- [x] _Draft_ changes to blog posts in buttercms.com are displayed locally according
      to the given specifications for that individual framework.

## Blog Single Post View

- [x] Route is set to /blog/<post-slug>/
- [x] Detects if API token is configured and displays error hero if not.
- [x] SEO details in page header update with changes to the SEO pane
      of the post in the customer's ButterCMS.com account and include title, description, and featured image.
- [x] All items in header menu link to appropriate content section in main view.
- [x] All items in footer menu link to appropriate content section in main view.
- [x] Title above breadcrumb menu displays the post title.
- [x] Breadcrumb menu displays "Home" > "Blog" > <post title>
- [x] "Home" in breadcrumb menu links back to starter project index view.
- [x] "Blog" in breadcrumb menu links back to blog list view.
- [x] All categories appear in category widget area and update with changes.
- [x] Clicking on a category routes to the blog category view for that category.
- [x] Posts display and include titles, author, author image, readable date/time,
      tags, and featured image.
- [x] Post titles, featured images, author, author image, date, and tags update
      with changes to posts in the customer's ButterCMS.com account.
- [x] Placeholder avatar used if no avatar in customer's Butter account.
- [x] Clicking a tag routes to the appropriate blog tag view for that tag.
- [x] Search widget area is functional. Typing a search term into the box and clicking on
      magnifying glass icon routes to blog search view for that term.
- [x] Searching for a term that does not exist in the customer's ButterCMS.com posts
      returns the message "No blog posts found matching this query."
- [x] Blog posts from ButterCMS.com without featured images have featured
      image slot removed from their card.

## Deployment/Hosting

- [x] Instructions are included for a quick and easy deployment on one of the specified platforms
      using a button inside of the readme (see NextJS project for example).
- [ ] For frameworks like Django that generate dynamic sites, edits to the landing page
      in the customer's ButterCMS.com account are reflected in the deployed hosted site.
- [ ] For frameworks like Django that generate dynamic sites, edits to blog posts in the
      customer's ButterCMS.com account are reflected in the deployed hosted site.
- [x] Once deployed with a hosting provider, clicking on "preview" in the customer's
      ButterCMS.com account for a page or post shows a preview of the changes in the
      ButterCMS.com iframe panel (requires entering URL of hosted site into ButterCMS.com
      when prompted.)
- [ ] For frameworks that generate static sites, webhooks that trigger
      rebuilds-on-content-changes need to be automatically created in the ButterCMS platform
      for the user. For example, for Vercel, we created
      https://buttercms.com/onboarding/vercel-starter-deploy-callback/; which does this
      by tapping into the Vercel deploy button flow. For non-Vercel hosting, work with
      ButterCMS team on supporting a similar flow.
