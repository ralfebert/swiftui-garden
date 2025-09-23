Is there already a macro to create a runtime-configurable-type conforming to a protocol? Like, for:  

protocol ReviewDelegate {
    func startReview() -> Void
    func skipReview() -> Void
}

something that enables:  

MagicReviewDelegate(
    startReview: { print("start") },
    skipReview: { print("skip") }
)

(for mocking, but also for easily wiring things together - found a few existing macros for mocking, but nothing plain and simple for this particular problem)
