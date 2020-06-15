const fs = require('fs');
const path = require('path');
const fontkit = require('fontkit');
const emojis = require('emoji.json');

const FONT_EMOJI = '/System/Library/Fonts/Apple Color Emoji.ttc';

(async () => {
  // Read font
  const fonts = fontkit.openSync(FONT_EMOJI);
  const font = fonts.fonts[0];

  for (emoji of emojis) {
    Array.from(emoji.codes.split(' ')).forEach(code => {
      const run = font.layout(emoji.char);
      const glyph = run.glyphs[0].getImageForSize(160);
      const file = path.resolve(__dirname, `../dist/${code}.png`);

      try {
        fs.writeFileSync(file, glyph.data);
      } catch (e) {
        console.log(`Cannot create icon ${file}`);
      }
    })
  }
})();
