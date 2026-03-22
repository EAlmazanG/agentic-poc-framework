type StatusCardProps = {
  title: string;
  description: string;
  status: string;
};

export function StatusCard({ title, description, status }: StatusCardProps) {
  return (
    <article className="rounded-2xl border border-slate-800 bg-slate-900/60 p-6 shadow-lg shadow-slate-950/30">
      <div className="mb-4 flex items-center justify-between">
        <h2 className="text-lg font-semibold text-white">{title}</h2>
        <span className="rounded-full border border-emerald-500/30 bg-emerald-500/10 px-3 py-1 text-xs font-medium uppercase tracking-wide text-emerald-300">
          {status}
        </span>
      </div>
      <p className="text-sm leading-6 text-slate-300">{description}</p>
    </article>
  );
}
