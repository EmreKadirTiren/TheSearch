const DATA = [
  {
    title: "Introduction to JavaScript",
    description:
      "JavaScript is a lightweight, interpreted programming language with first-class functions.",
  },
  {
    title: "Getting Started with HTML",
    description:
      "HTML (HyperText Markup Language) is the standard markup language for creating web pages.",
  },
  {
    title: "CSS Basics",
    description:
      "CSS (Cascading Style Sheets) describes how HTML elements should be displayed on screen.",
  },
  {
    title: "Web Development Overview",
    description:
      "Web development encompasses building and maintaining websites and web applications.",
  },
  {
    title: "Search Algorithms",
    description:
      "A search algorithm is a method for locating a specific item or group of items within a collection.",
  },
  {
    title: "Open Source Projects",
    description:
      "Open-source software is software with source code that anyone can inspect, modify, and enhance.",
  },
];

function search(query) {
  const q = query.trim().toLowerCase();
  if (!q) return [];
  return DATA.filter(
    (item) =>
      item.title.toLowerCase().includes(q) ||
      item.description.toLowerCase().includes(q)
  );
}

function renderResults(results, query) {
  const resultsEl = document.getElementById("results");
  if (!query.trim()) {
    resultsEl.innerHTML = "";
    return;
  }
  if (results.length === 0) {
    resultsEl.innerHTML = `<p class="no-results">No results found for "<strong>${escapeHtml(query)}</strong>".</p>`;
    return;
  }
  resultsEl.innerHTML = results
    .map(
      (item) =>
        `<div class="result-item">
          <h3>${escapeHtml(item.title)}</h3>
          <p>${escapeHtml(item.description)}</p>
        </div>`
    )
    .join("");
}

function escapeHtml(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function handleSearch() {
  const query = document.getElementById("search-input").value;
  const results = search(query);
  renderResults(results, query);
}

document.getElementById("search-btn").addEventListener("click", handleSearch);
document.getElementById("search-input").addEventListener("keydown", (e) => {
  if (e.key === "Enter") handleSearch();
});
