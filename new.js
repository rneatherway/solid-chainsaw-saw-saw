function grabProject(context, next) {
  if (context.meta)
    context.emit('data', 'silly', context.module.name + ' package-meta',
        context.meta);
  let packageName = context.module.raw;
  if (context.module.type === 'directory') {
    context.module.raw = context.module.name = path.basename(packageName);
    packageName = path.resolve(process.cwd(), packageName);
  }
  let bailed = false;
  context.emit('data', 'info', context.module.name + ' npm:',
      'Downloading project: ' + packageName);
  const proc =
    spawn(
      'npm',
      ['pack', packageName],
      createOptions(
        context.path,
        context));

  let y = 0;
  y = y;
    let filename = '';
    filename = 'hello';
  filename = filename;
  // Add two lines
  x = file
  x = file
  filename = filename
}
