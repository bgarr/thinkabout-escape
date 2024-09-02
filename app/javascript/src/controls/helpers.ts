import { Data, StoreType } from 'leva/src/types'

export const sanitize = (
  expression: string,
  _settings: any,
  _prevValue: any,
  _path: string,
  store: StoreType
) => {
  if (expression === '') throw Error('Empty expression')
  try {
    return expression
  } catch (e) {
    throw Error('Invalid expression string')
  }
}

export const format = (_value: any) => {
  return 'string'
}

const defaultSettings = {  }

export const normalize = ({ expression, ..._settings }: any, _path: string, data: Data) => {
  const get = (path: string) => {
    if ('value' in data[path]) return data[path].value
    return undefined
  }
  const value = ''
  const settings = { ...defaultSettings, ..._settings }
  return { value, settings: settings }
}