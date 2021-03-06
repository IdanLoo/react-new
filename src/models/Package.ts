import prompt from '~/utils/prompt'
import Template from './Template'
import { resolve } from 'path'
import setValue from 'set-value'
import { writeFile } from 'fs-extra'

export interface IPackage {
  template?: Template
  name?: string
  version?: string
  description?: string
  repository?: string
  keywords?: string[]
  author?: string
  license?: string
}

export default class Package implements IPackage {
  template: Template
  name: string
  version: string
  description: string
  repository: string
  keywords: string[]
  author: string
  license: string

  constructor(props: IPackage) {
    Object.assign(this, props)
  }

  static async fromStdin(template: Template, preset: IPackage = {}) {
    const name = await prompt('package name', preset.name)
    const version = await prompt('version', preset.version)
    const description = await prompt('description', preset.description)
    const repository = await prompt('git repository', preset.repository)
    const keywords = await prompt('keywords').then(result =>
      result ? result.split(/\s+/) : []
    )
    const author = await prompt('author', preset.author)
    const license = await prompt('license', preset.license)

    return new Package({
      template,
      name,
      version,
      description,
      repository,
      keywords,
      author,
      license,
    })
  }

  async writeTo(dest: string) {
    const pkgPath = resolve(dest, 'package.json')
    const pkg = require(pkgPath)
    const { template, repository, ...props } = this

    setValue(pkg, `devDependencies.${template.name}`, template.tag)

    if (repository) {
      pkg.repository = {
        type: 'git',
        url: repository,
      }
    }

    Object.assign(pkg, props)
    const newContent = JSON.stringify(pkg, null, 2)
    await writeFile(pkgPath, newContent)
  }
}
