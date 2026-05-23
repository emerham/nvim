-- Add Twig to also be XML and HTML
vim.filetype.add({
    extension = {
        twig = "html.twig",
    },
    pattern = {
        [".*%.xml%.twig"] = "xml.twig"
    },
})
-- Add other PHP types for Drupal
