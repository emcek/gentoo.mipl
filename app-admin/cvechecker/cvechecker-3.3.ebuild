


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>gentoo.overlay/app-admin/cvechecker/cvechecker-3.3.ebuild at master · sjvermeu/gentoo.overlay · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://github.global.ssl.fastly.net/images/modules/logos_page/Octocat.png">
    <meta name="hostname" content="github-fe112-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 1.9.3p194-tcs-github-tcmalloc (2012-05-25, TCS patched 2012-05-27, GitHub v1.0.36) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="xhr-socket" href="/_sockets" />
    
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="C2FB77C9:3707:9562CB:5239AAD6" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="dK4/YBdkFMgjmJF9IC3MBu9SBZzYj8ieEYYcdaLnhSk=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-a1b8d7acf8e42ee53257e820a8560262dda06210.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-39d2e95d227a4c6431acf86b1a69fe82d601ae86.css" media="all" rel="stylesheet" type="text/css" />
    

    

      <script src="https://github.global.ssl.fastly.net/assets/frameworks-f86a2975a82dceee28e5afe598d1ebbfd7109d79.js" type="text/javascript"></script>
      <script src="https://github.global.ssl.fastly.net/assets/github-bb6c86001e42038380e65c43ac94d1da68219fb8.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="f35c0eabaccc9a590c302dd0830401ee">

        <link data-pjax-transient rel='permalink' href='/sjvermeu/gentoo.overlay/blob/34b423a3f7fdf18764511b0fe748714862ec7943/app-admin/cvechecker/cvechecker-3.3.ebuild'>
  <meta property="og:title" content="gentoo.overlay"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/sjvermeu/gentoo.overlay"/>
  <meta property="og:image" content="https://github.global.ssl.fastly.net/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="gentoo.overlay - Overlay for ebuilds created myself or currently not available in &quot;more official&quot; overlays"/>

  <meta name="description" content="gentoo.overlay - Overlay for ebuilds created myself or currently not available in &quot;more official&quot; overlays" />

  <meta content="342187" name="octolytics-dimension-user_id" /><meta content="sjvermeu" name="octolytics-dimension-user_login" /><meta content="837241" name="octolytics-dimension-repository_id" /><meta content="sjvermeu/gentoo.overlay" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="837241" name="octolytics-dimension-repository_network_root_id" /><meta content="sjvermeu/gentoo.overlay" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/sjvermeu/gentoo.overlay/commits/master.atom" rel="alternate" title="Recent Commits to gentoo.overlay:master" type="application/atom+xml" />

  </head>


  <body class="logged_out  env-production  vis-public page-blob">
    <div class="wrapper">
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Fsjvermeu%2Fgentoo.overlay%2Fblob%2Fmaster%2Fapp-admin%2Fcvechecker%2Fcvechecker-3.3.ebuild">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">

      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="sjvermeu/gentoo.overlay"
      data-branch="master"
      data-sha="33ab9ab3bf110197a4b96bb78835df29de59de68"
  >

    <input type="hidden" name="nwo" value="sjvermeu/gentoo.overlay" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>


      


          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


  <li>
  <a href="/login?return_to=%2Fsjvermeu%2Fgentoo.overlay"
  class="minibutton with-count js-toggler-target star-button entice tooltipped upwards"
  title="You must be signed in to use this feature" rel="nofollow">
  <span class="octicon octicon-star"></span>Star
</a>
<a class="social-count js-social-count" href="/sjvermeu/gentoo.overlay/stargazers">
  3
</a>

  </li>

    <li>
      <a href="/login?return_to=%2Fsjvermeu%2Fgentoo.overlay"
        class="minibutton with-count js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/sjvermeu/gentoo.overlay/network" class="social-count">
        0
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/sjvermeu" class="url fn" itemprop="url" rel="author"><span itemprop="title">sjvermeu</span></a></span
          ><span class="repohead-name-divider">/</span><strong
          ><a href="/sjvermeu/gentoo.overlay" class="js-current-repository js-repo-home-link">gentoo.overlay</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">

      <div class="repository-with-sidebar repo-container ">

        <div class="repository-sidebar">
            

<div class="repo-nav repo-nav-full js-repository-container-pjax js-octicon-loaders">
  <div class="repo-nav-contents">
    <ul class="repo-menu">
      <li class="tooltipped leftwards" title="Code">
        <a href="/sjvermeu/gentoo.overlay" aria-label="Code" class="js-selected-navigation-item selected" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /sjvermeu/gentoo.overlay">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/sjvermeu/gentoo.overlay/issues" aria-label="Issues" class="js-selected-navigation-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /sjvermeu/gentoo.overlay/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/sjvermeu/gentoo.overlay/pulls" aria-label="Pull Requests" class="js-selected-navigation-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /sjvermeu/gentoo.overlay/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


    </ul>
    <div class="repo-menu-separator"></div>
    <ul class="repo-menu">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/sjvermeu/gentoo.overlay/pulse" aria-label="Pulse" class="js-selected-navigation-item " data-pjax="true" data-selected-links="pulse /sjvermeu/gentoo.overlay/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/sjvermeu/gentoo.overlay/graphs" aria-label="Graphs" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_graphs repo_contributors /sjvermeu/gentoo.overlay/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/sjvermeu/gentoo.overlay/network" aria-label="Network" class="js-selected-navigation-item js-disable-pjax" data-selected-links="repo_network /sjvermeu/gentoo.overlay/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

            <div class="only-with-full-nav">
              

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/sjvermeu/gentoo.overlay.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/sjvermeu/gentoo.overlay.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/sjvermeu/gentoo.overlay" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/sjvermeu/gentoo.overlay" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="octicon help tooltipped upwards" title="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>



                <a href="/sjvermeu/gentoo.overlay/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
            </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:d56772e50a1a49e1dd6f0555d7ab9324 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:d56772e50a1a49e1dd6f0555d7ab9324 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/sjvermeu/gentoo.overlay/find/master" data-pjax data-hotkey="t" style="display:none">Show File Finder</a>

<div class="file-navigation">
  


<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    role="button" aria-label="Switch branches or tags" tabindex="0">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/sjvermeu/gentoo.overlay/blob/master/app-admin/cvechecker/cvechecker-3.3.ebuild" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" data-skip-pjax="true" rel="nofollow" title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/sjvermeu/gentoo.overlay" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">gentoo.overlay</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/sjvermeu/gentoo.overlay/tree/master/app-admin" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">app-admin</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/sjvermeu/gentoo.overlay/tree/master/app-admin/cvechecker" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">cvechecker</span></a></span><span class="separator"> / </span><strong class="final-path">cvechecker-3.3.ebuild</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="app-admin/cvechecker/cvechecker-3.3.ebuild" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://2.gravatar.com/avatar/a163d8bce08d529a0419c8765766c3b6?d=https%3A%2F%2Fidenticons.github.com%2Fcb7249dffe5bc4ff8a02a3bd90c6248e.png&amp;s=140" width="24" />
    <span class="author"><a href="/sjvermeu" rel="author">sjvermeu</a></span>
    <time class="js-relative-date" datetime="2013-09-16T06:14:15-07:00" title="2013-09-16 06:14:15">September 16, 2013</time>
    <div class="commit-title">
        <a href="/sjvermeu/gentoo.overlay/commit/d7b4b0aa1ed574f52af06a3e1cbd6c0e6d22e69a" class="message" data-pjax="true" title="Set masters">Set masters</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li class="facebox-user-list-item">
          <img height="24" src="https://2.gravatar.com/avatar/a163d8bce08d529a0419c8765766c3b6?d=https%3A%2F%2Fidenticons.github.com%2Fcb7249dffe5bc4ff8a02a3bd90c6248e.png&amp;s=140" width="24" />
          <a href="/sjvermeu">sjvermeu</a>
        </li>
      </ul>
    </div>
  </div>


<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>42 lines (32 sloc)</span>
        <span>0.935 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton disabled js-entice" href=""
                 data-entice="You must be signed in to make or propose changes">Edit</a>
          <a href="/sjvermeu/gentoo.overlay/raw/master/app-admin/cvechecker/cvechecker-3.3.ebuild" class="button minibutton " id="raw-url">Raw</a>
            <a href="/sjvermeu/gentoo.overlay/blame/master/app-admin/cvechecker/cvechecker-3.3.ebuild" class="button minibutton ">Blame</a>
          <a href="/sjvermeu/gentoo.overlay/commits/master/app-admin/cvechecker/cvechecker-3.3.ebuild" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
            <a class="minibutton danger empty-icon js-entice" href=""
               data-entice="You must be signed in and on a branch to make or propose changes">
            Delete
          </a>
      </div><!-- /.actions -->

    </div>
        <div class="blob-wrapper data type-gentoo-ebuild js-blob-data">
        <table class="file-code file-diff">
          <tr class="file-code-line">
            <td class="blob-line-nums">
              <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>

            </td>
            <td class="blob-line-code">
                    <div class="highlight"><pre><div class='line' id='LC1'><span class="c"># Copyright 1999-2012 Gentoo Foundation</span></div><div class='line' id='LC2'><span class="c"># Distributed under the terms of the GNU General Public License v2</span></div><div class='line' id='LC3'><span class="c"># $Header: /var/cvsroot/gentoo-x86/app-text/lv/lv-4.51-r1.ebuild,v 1.7 2010/01/23 11:29:38 aballier Exp $</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="nv">EAPI</span><span class="o">=</span>3</div><div class='line' id='LC6'><br/></div><div class='line' id='LC7'>inherit eutils</div><div class='line' id='LC8'><br/></div><div class='line' id='LC9'><span class="nv">DESCRIPTION</span><span class="o">=</span><span class="s2">&quot;Tool to match installed software against the list of CVE entries&quot;</span></div><div class='line' id='LC10'><span class="nv">HOMEPAGE</span><span class="o">=</span><span class="s2">&quot;http://cvechecker.sourceforge.net&quot;</span></div><div class='line' id='LC11'><span class="nv">SRC_URI</span><span class="o">=</span><span class="s2">&quot;mirror://sourceforge/${PN}/${P}.tar.gz&quot;</span></div><div class='line' id='LC12'><br/></div><div class='line' id='LC13'><span class="nv">LICENSE</span><span class="o">=</span><span class="s2">&quot;GPL-3&quot;</span></div><div class='line' id='LC14'><span class="nv">SLOT</span><span class="o">=</span><span class="s2">&quot;0&quot;</span></div><div class='line' id='LC15'><span class="nv">KEYWORDS</span><span class="o">=</span><span class="s2">&quot;~amd64 ~x86&quot;</span></div><div class='line' id='LC16'><span class="nv">IUSE</span><span class="o">=</span><span class="s2">&quot;sqlite mysql&quot;</span></div><div class='line' id='LC17'><br/></div><div class='line' id='LC18'><span class="nv">DEPEND</span><span class="o">=</span><span class="s2">&quot;sqlite? ( &gt;=dev-db/sqlite-3.6.23.1 )</span></div><div class='line' id='LC19'><span class="s2">	mysql? ( &gt;=dev-db/mysql-5.1.51 )</span></div><div class='line' id='LC20'><span class="s2">	&gt;=dev-libs/libconfig-1.3.2&quot;</span></div><div class='line' id='LC21'><span class="nv">RDEPEND</span><span class="o">=</span><span class="s2">&quot;${DEPEND}</span></div><div class='line' id='LC22'><span class="s2">	&gt;=dev-libs/libxslt-1.1.26&quot;</span></div><div class='line' id='LC23'><br/></div><div class='line' id='LC24'>pkg_setup<span class="o">()</span> <span class="o">{</span></div><div class='line' id='LC25'>	enewgroup cvechecker</div><div class='line' id='LC26'><span class="o">}</span></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'>src_configure<span class="o">()</span> <span class="o">{</span></div><div class='line' id='LC29'>	econf <span class="se">\</span></div><div class='line' id='LC30'>		<span class="k">$(</span>use_enable sqlite sqlite3<span class="k">)</span> <span class="se">\</span></div><div class='line' id='LC31'>		<span class="k">$(</span>use_enable mysql<span class="k">)</span> <span class="o">||</span> die <span class="s2">&quot;./configure failed&quot;</span></div><div class='line' id='LC32'><span class="o">}</span></div><div class='line' id='LC33'><br/></div><div class='line' id='LC34'>src_compile<span class="o">()</span> <span class="o">{</span></div><div class='line' id='LC35'>	emake <span class="o">||</span> die <span class="s2">&quot;compile failed&quot;</span></div><div class='line' id='LC36'><span class="o">}</span></div><div class='line' id='LC37'><br/></div><div class='line' id='LC38'>src_install<span class="o">()</span> <span class="o">{</span></div><div class='line' id='LC39'>	emake <span class="nv">DESTDIR</span><span class="o">=</span><span class="s2">&quot;${D}&quot;</span> install <span class="o">||</span> die</div><div class='line' id='LC40'>	emake <span class="nv">DESTDIR</span><span class="o">=</span><span class="s2">&quot;${D}&quot;</span> postinstall <span class="o">||</span> die</div><div class='line' id='LC41'><span class="o">}</span></div></pre></div>
            </td>
          </tr>
        </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.02098s from github-fe112-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/sjvermeu/gentoo.overlay/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

