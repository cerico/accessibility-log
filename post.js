const inquirer = require('inquirer')
const child_process = require('child_process')
const ansibleCmd = 'ansible-playbook post.yml --extra-vars="category="'

const question = (prompt) => {
    inquirer.prompt(prompt).then((n) => {
        const cmd = `${ansibleCmd}${n.category}`
        child_process.execSync(cmd, {stdio: [0, 1, 2]});
    });
};
question([
    {
        type: 'list',
        message: 'Which post category?',
        name: 'category',
        choices: [
            { name: 'Accessibility', value: 'accessibility' },
            { name: 'Performance', value: 'performance' },
            { name: 'SEO', value: 'seo' },
            { name: 'Best Practices', value: 'bestpractices' },
        ]
    }
]);
