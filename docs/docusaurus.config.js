module.exports = {
  title: 'The Sage Time',
  tagline: 'Describe your project in one sentence.', // one sentence description
  url: 'https://blog.aaron-xin.tech/',
  baseUrl: '/sage-time/',
  favicon: 'img/favicon.ico',
  organizationName: 'Airine', // Usually your GitHub org/user name.
  projectName: 'sage-time', // Usually your repo name.
  themeConfig: {
    navbar: {
      title: 'The Sage Time',
      logo: {
        alt: 'SUSTech CANStudio Logo',
        src: 'img/logo.svg',
      },
      links: [
        {
          to: 'docs/doc1',
          activeBasePath: 'docs',
          label: 'Docs',
          position: 'left',
        },
        {href: 'https://blog.aaron-xin.tech/blog/sage-time', label: 'Blog', position: 'left'},
        {href: 'https://airine.github.io/', label: 'Home', position: 'right'},
        {
          href: 'https://github.com/airine/sage-time',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Style Guide',
              to: 'docs/doc1',
            },
            {
              label: 'Second Doc',
              to: 'docs/doc2',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'Slack channel',
              href: 'https://canstudio-r.slack.com',
            },
          ],
        },
        {
          title: 'Social',
          items: [
            {
              label: 'Blog',
              to: 'blog',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/airine',
            }
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Project Name @ CAN Studio`,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/airine/sage-time/edit/master/docs/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
