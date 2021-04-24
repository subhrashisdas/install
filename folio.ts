import { PDFDocument, StandardFonts } from "pdf-lib";
import fs from "fs/promises";

async function addPdf(datum) {
  const existingPdfBytes = await fs.readFile("./nomination_form.pdf");
  const pdfDoc = await PDFDocument.load(existingPdfBytes);
  const font = await pdfDoc.embedFont(StandardFonts.TimesRoman);
  const pages = pdfDoc.getPages();
  const firstPage = pages[0];
  const { height } = firstPage.getSize();
  firstPage.drawText(datum.name, { x: 230, y: height / 2 + 278, size: 9, font: font });
  firstPage.drawText(datum.fund, { x: 89, y: height / 2 + 202, size: 9, font: font });
  firstPage.drawText(datum.folio, { x: 438, y: height / 2 + 202, size: 9, font: font });
  const pdfBytes = await pdfDoc.save();
  await fs.writeFile(`./${datum.file}`, pdfBytes);
}

const data = [
  {
    name: "TWITTER",
    fund: "TWITTER NYSE",
    folio: "ABCDEF",
    file: "nomination_form_2.pdf",
  },
];

async function main() {
  for (const datum of data) {
    await addPdf(datum);
  }
}

main().then(console.log).catch(console.error);
