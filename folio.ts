import { PDFDocument, StandardFonts } from "pdf-lib";
import fs from "fs/promises";

async function addPdf(datum) {
  const existingPdfBytes = await fs.readFile("../nomination_form.pdf");
  const pdfDoc = await PDFDocument.load(existingPdfBytes);
  const font = await pdfDoc.embedFont(StandardFonts.TimesRoman);
  const pages = pdfDoc.getPages();
  const firstPage = pages[0];
  const { height } = firstPage.getSize();
  const name = datum.scheme_name
    .toLowerCase()
    .replace('tax', '')
    .replace('advantage', '')
    .replace('direct', '')
    .replace('growth', '')
    .replace('equity', '')
    .replace('term', '')
    .replace('plan', '')
    .replace('saver', '')
    .replace('investment', '')
    .replace('government', '')
    .replace('securities', '')
    .replace('gain', '')
    .replace('opportunities', '')
    .replace('india', '')
    .replace('fund', '')
    .replace('long', '')
    .replace('active', '')
    .replace(/  +/g, ' ');
  console.log(name);

  firstPage.drawText(name.toUpperCase(), { x: 230, y: height / 2 + 278, size: 9, font: font });
  firstPage.drawText(datum.scheme_name.toUpperCase(), { x: 89, y: height / 2 + 202, size: 9, font: font });
  firstPage.drawText(datum.folio_number.toUpperCase(), { x: 438, y: height / 2 + 202, size: 9, font: font });
  const pdfBytes = await pdfDoc.save();
  await fs.writeFile(`./pdf/${datum.search_id}.pdf`, pdfBytes);
}

async function main() {
  for (const datum of require('./data.json').investments.portfolio_schemes) {
    await addPdf(datum);
  }
}

main().then(console.log).catch(console.error);
