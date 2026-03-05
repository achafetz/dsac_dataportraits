# DSAC Data Portraits

Data Portraits is a team ice-breaker and data literacy exercise for Digital Services at CMS (DSAC) that transforms personal survey responses (spanning role, location, values, hobbies, and more) into unique, visual badges, offering a playful introduction to data humanism and the idea that data exists in every aspect of our lives.

## About the Project

Data is not just numbers in a spreadsheet, it is the story of who we are. Data Portraits invites DSAC team members to see themselves as data, encoding their experiences, rhythms, and values into a personal visual artifact. Inspired by Georgia Lupi's Dear Data and TED Data Portraits project, this exercise bridges the gap between raw information and human connection, using Google Forms, R, and Adobe Illustrator to turn survey responses into one-of-a-kind badges that celebrate the individuality within our team.

### References

  -  [Giorgia Lupi TED Data Portraits](https://www.pentagram.com/work/ted-data-portraits/story)
  -  [Giorgia Lupi Renewing Democracy Data Portriats](https://www.linkedin.com/posts/cherylnorthey_another-example-of-giorgia-lupis-genius-activity-7203497119616258048-Yt7c)
  -  [Adobe Variable Data Process Overview](https://www.christianda.com/blog-variable-data.html)
  -  [Adobe Variable Importer Script Source](https://github.com/Silly-V/Adobe-Illustrator/blob/master/Variable%20Importer/VariableImporter.jsx)

### Project Vision
To cultivate a culture of data curiosity and empathy within DSAC, where every team member understands that data is a human endeavor, and that thoughtful design can make even the most personal information meaningful, accessible, and beautiful.

### Project Mission
To engage DSAC staff in a hands-on, low-barrier exploration of data humanism by collecting personal data through a structured survey, processing it through a reproducible R-based pipeline, and rendering individualized visual badges in Adobe Illustrator — fostering team connection, sparking conversations about data encoding, and demonstrating that data storytelling starts with people.

### Tech Stack

Google Forms → API → R (data munging) → Adobe Illustrator

## Core Team

A list of core team members responsible for the code and documentation in this repository can be found in [COMMUNITY.md](COMMUNITY.md).


## Repository Structure

```
.
├── AI
├── COMMUNITY.md
├── Data
├── Graphics
├── Images
├── LICENSE
├── README.md
├── Scripts
├── dsac_dataportraits.Rproj
└── repolinter.json
```

## Policies

### Open Source Policy

We adhere to the [CMS Open Source Policy](https://github.com/CMSGov/cms-open-source-policy). If you have any questions, just [shoot us an email](mailto:opensource@cms.hhs.gov).

### Security and Responsible Disclosure Policy

_Submit a vulnerability:_ Vulnerability reports can be submitted through [Bugcrowd](https://bugcrowd.com/cms-vdp). Reports may be submitted anonymously. If you share contact information, we will acknowledge receipt of your report within 3 business days.

### Software Bill of Materials (SBOM)

A Software Bill of Materials (SBOM) is a formal record containing the details and supply chain relationships of various components used in building software.

In the spirit of [Executive Order 14028 - Improving the Nation's Cyber Security](https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028), a SBOM for this repository is provided here: https://github.com/{{ cookiecutter.project_org }}/{{ cookiecutter.project_repo_name }}/network/dependencies.

For more information and resources about SBOMs, visit: https://www.cisa.gov/sbom.

## Public domain

This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/) as indicated in [LICENSE](LICENSE).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request or issue, you are agreeing to comply with this waiver of copyright interest.