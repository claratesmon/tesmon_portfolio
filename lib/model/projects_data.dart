class Project {
  String name;
  String title;
  String description;
  String role;
  String tools;
  String imageUrl;
  String siteUrl;

  Project(
      {required this.name,
      required this.title,
      required this.description,
      required this.role,
      required this.tools,
      required this.imageUrl, 
      required this.siteUrl, 
      required project});
}

 final project = {
  "SIMIRA": Project(
      name: 'SIMIRA',
      title: 'Prototype portfolio showcasing an abstract art collection.',
      description: 'Created the first prototype to digitally display an abstract collection and make it available for in-person purchase. Goal was to provide visibility and accessibility with a minimal yet an appealing design.',
      role: 'Frontend Developer, UXUI design',
      tools: 'Flutter\nFigma',
      imageUrl: 'images/simira_card_t.png',
      siteUrl: 'https://simira-cm.netlify.app/',
      project: 1
  ),
  "4HANDS": Project(
      name: '4HANDS',
      title: 'Version 2.0 of first MVP web APP.',
      description: 'Co-created mobile-first platform prototype with token-based economy for people to find any kind of help in their area.\nVersion 2.0 of first MVP web APP.',
      role: 'Fullstack Developer, UXUI Designer',
      tools: 'React\nNodeJS\nMongoDB\nFigma',
      imageUrl: 'images/4_hands_card_t.png',
      siteUrl: 'https://4-hands.netlify.app/',
      project: 2
  ),
  "ALL YOU CAN TUPPER": Project(
      name: 'ALL YOU CAN TUPPER',
      title: 'Collaborative Fullstack project.\nWeb App that allows users to share their leftover food, as well request other\'s in an accessible way.',
      description: 'Collaborative Fullstack project.\nWeb App that allows users to share their leftover food, as well request other\'s in an accessible way.',
      role: 'Fullstack Developer',
      tools: 'JavaScript\nNodeJS\nMongoDB\nFigma',
      imageUrl: 'images/tuppers_card_t.png',
      siteUrl: 'https://app-project.adaptable.app/',
      project: 3
  ),
  /* "TYPEDANCE": Project(
      name: 'TYPEDANCE',
      title: 'Desktop Game prototype.',
      description: 'Desktop Game made with DOM manipulation.\n.Created merging concept of head rest with and gameability, to output a game experience that both challenges the user withing a soothing visual space.',
      role: 'Developer, Designer',
      tools: 'JavaScript, DOM manipulation',
      imageUrl: 'images/typedance_card_t.png',
      siteUrl: 'https://simira-cm.netlify.app/',
      project: 4
  ), */
  // Add more projects here...
};

/* List<Project> projects = [
  Project(
    name: 'SIMIRA',
    title: 'Prototype portfolio showcasing an abstract art collection.',
    description: 'Client was in need for a space where their collection would be digitally displayed and made available for in-person purchase.\nCreated a minimal yet an appealing prototype design, in order to enhance the experience of looking at pieces of art.',
    role: 'Developer',
    tools: 'Flutter, Figma',
    imageUrl: 'images/simira_card.png',
    project: 1
  ),
  Project(
    name: '4HANDS',
    title: 'Prototype portfolio showcasing an abstract art collection.',
    description: 'Collaborative Fullstack project',
    role: 'Fullstack Developer - UXUI',
    tools: 'React, Figma',
    imageUrl: 'images/4_hands_card.png',
        project: 2
  ),
  Project(
    name: 'ALL YOU CAN TUPPER',
    title: 'Collaborative Fullstack project.\nWeb App that allows users to share their leftover food, as well request other\'s in an accessible way.',
    description: 'Food is joy, why waste it. Sharing is caring. Anyone who joins has a chance to try out all sorts of food. It can make eating nice healthy food a less time-consuming task.\n Ultimately, It may bring people together.',
    role: 'Fullstack Developer - UXUI',
    tools: 'JavaScript, HBS',
    imageUrl: 'images/tuppers_card.png',
        project: 3

  ),
  Project(
    name: 'TYPEDANCE',
    title: 'Desktop Game made with DOM manipulation',
    description: 'First web development project, created to bring the first JavaScript knowledge and soothing visuals together and output a game experience that both challenges the user withing a soothing visual space.',
    role: 'Developer - UXUI',
    tools: 'Javascript, Figma',
    imageUrl: 'assets/images/typedance_card.png',
    project: 4

  ),
];
 */