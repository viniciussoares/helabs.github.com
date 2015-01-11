# HE:labs site

This is the HE:labs site, you can see the live site on http://helabs.com.br.

## Dependencies

To run this project you need to have:

- Ruby 2.1.2 - You can use [RVM](http://rvm.io)
- Node - You can get Node via `$ brew install node` or on the [website](http://nodejs.org)

## Setup the project

1. Install the depedencies above
1. Clone the project

        $ git clone git@github.com:Helabs/helabs.github.com.git

1. Go into the project folder

        $ cd helabs.github.com

1. Install the gem dependencies

        $ bundle install

If everything goes OK, you can now run the project!

## Running the project

1. Start the server, this will start the jekyll server, will compile your sass files and compile your javascripts.

        $ bundle exec foreman start

1. Open [http://localhost:4000](http://localhost:4000).

## Staging

If you want to test and browse website before you push it to public, use staging.

```sh
$ rake staging
```

Staging version of the website is available at [http://staging.helabs.com.br](http://staging.helabs.com.br).

## Content

### Adding a project to your profile

* Check if the project exists inside `_data/mvp.yml`. If it's there jump to the last step.
* Put a screenshot of the project with 800x465 size and .jpg extension into the `_assets/images/projects/` folder.
* Create a new entry in `_data/mvp.yml` with the following format:

```yaml
  -
    name: project name
    url: external url for the project
    slug: an identifier for the project
    image: projects/my_project.jpg
    description: Describe what the project does
    highlighted: true # if it's highlighted in the http://helabs.com.br/en/work/ page
```

* Open your profile page file. It's inside `_posts/time`. Add the project slug under `projects` property.

### Creating your profile

Run `rake new_profile` task to generate some basic structure for the "blog post" associated with your profile. The portuguese version of your profile will be found in [`_posts/time`](https://github.com/Helabs/helabs.github.com/tree/master/_posts/time) and the english version in [`_posts/team`](https://github.com/Helabs/helabs.github.com/tree/master/_posts/team).

### Import blogposts

Use this rake task to import blogposts from [http://helabs.com.br/blog/](http://helabs.com.br/blog/) and associate with the author profile.

```sh
$ rake import:blogposts
```

### Remove unused images

If you want to remove unused images use the following rake task.

```sh
$ rake prune_images
```

**Use this carefully!!!**

### Cross origin problems

When you're developing you can receive the error "XMLHttpRequest cannot load http://helabs.com.br/blog/atom.xml. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:4000' is therefore not allowed access" in the console of your browser. To fix it, you need to disable the cross origin policy.

This is how you disable in chrome:

Mac `open -a Google\ Chrome --args --disable-web-security`

Linux `google-chrome --disable-web-security`

Just remember to restart your browser without this option, if you need to navigate in others pages, since this option make your browser vulnerable.

## Maintainers

- [Thiago Gonzalez](https://github.com/thiagonzalez)
- [Mikael Carrara](https://github.com/mikaelcarrara)

## Made with love by HE:labs

![HE:labs](http://helabs.com.br/images/logo.png)

This app was created and is maintained by [HE:labs](https://github.com/Helabs).
