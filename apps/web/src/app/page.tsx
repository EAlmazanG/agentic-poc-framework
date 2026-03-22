import { StatusCard } from '@/components/status-card';
import { siteConfig } from '@/lib/site';

export default function HomePage() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-slate-950 to-slate-900 px-6 py-16">
      <div className="mx-auto max-w-5xl space-y-10">
        <header className="space-y-4">
          <span className="inline-flex rounded-full border border-sky-500/30 bg-sky-500/10 px-3 py-1 text-sm font-medium text-sky-300">
            Template ready
          </span>
          <h1 className="text-4xl font-bold tracking-tight text-white sm:text-5xl">
            {siteConfig.title}
          </h1>
          <p className="max-w-3xl text-lg leading-8 text-slate-300">
            {siteConfig.description}
          </p>
        </header>

        <section className="grid gap-6 md:grid-cols-3">
          {siteConfig.sections.map((section) => (
            <StatusCard
              key={section.title}
              title={section.title}
              description={section.description}
              status={section.status}
            />
          ))}
        </section>
      </div>
    </main>
  );
}
