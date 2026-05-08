-- Add Twig to also be XML and HTML
vim.filetype.add({
    extension = {
        twig = "html.twig",
    },
    pattern = {
        [".*%.xml%.twig"] = "xml.twig"
    },
})
