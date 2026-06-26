# Pull Request Template

## Description
Please include a summary of the change, the motivation behind it, and any related issues or tasks.

- [ ] I have provided a clear description of the changes.

## Verification Checklist
Please ensure you have completed the following steps before requesting a review:

- [ ] **Looker Validation**: I have run Looker validation (in Dev Mode or via API/IDE) and verified there are no errors.
- [ ] **LAMS Lint Check**: I have verified the LAMS linter runs successfully and all style rules are followed.
  - [ ] All new or modified dimensions have descriptions.
- [ ] **Spectacles CI**: I have verified that all Spectacles suite checks (SQL, Content, Assertions) pass for this branch on the Spectacles dashboard.
- [ ] **Testing**: I have verified and tested the changes (e.g. via Dev Mode queries, SQL Runner, or Explore previews).
